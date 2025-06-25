import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'provider_profile_event.dart';
part 'provider_profile_state.dart';

class ProviderProfileBloc extends Bloc<ProviderProfileEvent, ProviderProfileState> {
  ProviderProfileBloc() : super(ProviderProfileInitial()) {
    on<ProviderProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
