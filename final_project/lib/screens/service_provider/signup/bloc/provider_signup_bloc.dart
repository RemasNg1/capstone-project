import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'provider_signup_event.dart';
part 'provider_signup_state.dart';

class ProviderSignupBloc extends Bloc<ProviderSignupEvent, ProviderSignupState> {
  ProviderSignupBloc() : super(ProviderSignupInitial()) {
    on<ProviderSignupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
