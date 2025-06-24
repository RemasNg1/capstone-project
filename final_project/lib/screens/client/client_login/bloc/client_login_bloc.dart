import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'client_login_event.dart';
part 'client_login_state.dart';

class ClientLoginBloc extends Bloc<ClientLoginEvent, ClientLoginState> {
  ClientLoginBloc() : super(ClientLoginInitial()) {
    on<ClientLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
