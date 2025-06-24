import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_signup_event.dart';
part 'client_signup_state.dart';

class ClientSignupBloc extends Bloc<ClientSignupEvent, ClientSignupState> {
  ClientSignupBloc() : super(ClientSignupInitial()) {
    on<ClientSignupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
