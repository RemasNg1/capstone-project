import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'services_bookings_event.dart';
part 'services_bookings_state.dart';

class ServicesBookingsBloc extends Bloc<ServicesBookingsEvent, ServicesBookingsState> {
  ServicesBookingsBloc() : super(ServicesBookingsInitial()) {
    on<ServicesBookingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
