import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'provider_bottom_navbar_event.dart';
part 'provider_bottom_navbar_state.dart';

class ProviderBottomNavbarBloc extends Bloc<ProviderBottomNavbarEvent, ProviderBottomNavbarState> {
  ProviderBottomNavbarBloc() : super(ProviderBottomNavbarInitial()) {
    on<ProviderBottomNavbarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
