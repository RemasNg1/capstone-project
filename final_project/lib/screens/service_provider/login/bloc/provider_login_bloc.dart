import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'provider_login_event.dart';
part 'provider_login_state.dart';

class ProviderLoginBloc extends Bloc<ProviderLoginEvent, ProviderLoginState> {
  ProviderLoginBloc() : super(ProviderLoginInitial()) {
    on<ProviderLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
