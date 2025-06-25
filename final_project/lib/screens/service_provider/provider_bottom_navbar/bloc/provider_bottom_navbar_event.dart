part of 'provider_bottom_navbar_bloc.dart';

@immutable
sealed class ProviderBottomNavbarEvent {}

class NavSelectionEvent extends ProviderBottomNavbarEvent {
  final int index;

  NavSelectionEvent({required this.index});
}
