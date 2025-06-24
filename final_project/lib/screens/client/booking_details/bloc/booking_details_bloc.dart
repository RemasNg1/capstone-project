import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_details_event.dart';
part 'booking_details_state.dart';

class BookingDetailsBloc extends Bloc<BookingDetailsEvent, BookingDetailsState> {
  BookingDetailsBloc() : super(BookingDetailsInitial()) {
    on<BookingDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
