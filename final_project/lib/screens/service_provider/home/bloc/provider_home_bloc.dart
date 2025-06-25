import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'provider_home_event.dart';
part 'provider_home_state.dart';

class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {
  ProviderHomeBloc() : super(ProviderHomeInitial()) {
    on<ProviderHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
