import 'package:bloc/bloc.dart';
import 'package:final_project/models/booking_model/service_request.dart';
import 'package:final_project/repo/booking_repo.dart';

import 'package:final_project/screens/service_provider/service_booking2/bloc/service_booking_state.dart';
part 'service_booking_event.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final BookingRepository repository;
  List<ServiceRequest> _allBookings = [];

  BookingsBloc(this.repository) : super(BookingsLoading()) {
    on<LoadBookings>(_onLoad);
    on<UpdateBookingStatus>(_onUpdateStatus);
  }
  Future<void> _onLoad(LoadBookings event, Emitter emit) async {
    emit(BookingsLoading());

    try {
      final all = await repository.fetchProviderBookings();
      _allBookings = all;

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      final waiting = all.where((e) => e.status == "send").toList();
      final current = all
          .where((e) => e.status == "accepted" && !e.date.isBefore(today))
          .toList();
      final past = all
          .where((e) => e.status == "accepted" && e.date.isBefore(today))
          .toList();
      final canceled = all.where((e) => e.status == "rejected").toList();

      emit(
        BookingsLoaded(
          waiting: waiting,
          current: current,
          past: past,
          canceled: canceled,
        ),
      );
    } catch (e) {
      emit(BookingsError(e.toString()));
    }
  }

  // bool _isSameDay(DateTime d1, DateTime d2) {
  //   return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  // }
  Future<void> _onUpdateStatus(UpdateBookingStatus event, Emitter emit) async {
    try {
      await repository.updateStatus(event.requestId, event.newStatus);

      // 1. حدّث الطلب المعين في القائمة
      final index = _allBookings.indexWhere((e) => e.id == event.requestId);
      if (index != -1) {
        _allBookings[index] = _allBookings[index].copyWith(
          status: event.newStatus,
        );
      }

      // 2. اعاده تصنيف القوائم
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      final waiting = _allBookings.where((e) => e.status == "send").toList();

      final current = _allBookings
          .where((e) => e.status == "accepted" && !e.date.isBefore(today))
          .toList();

      final past = _allBookings
          .where((e) => e.status == "accepted" && e.date.isBefore(today))
          .toList();

      final canceled = _allBookings
          .where((e) => e.status == "rejected")
          .toList();

      // 3. أرسل الحالة الجديدة
      emit(
        BookingsLoaded(
          waiting: waiting,
          current: current,
          past: past,
          canceled: canceled,
        ),
      );
    } catch (e) {
      emit(BookingsError(e.toString()));
    }
  }

  bool _isToday(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
