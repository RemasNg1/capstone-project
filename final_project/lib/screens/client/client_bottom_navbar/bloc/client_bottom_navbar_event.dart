part of 'client_bottom_navbar_bloc.dart';

@immutable
sealed class ClientBottomNavbarEvent {}

class NavSelectionEvent extends ClientBottomNavbarEvent {
  final int index;

  NavSelectionEvent({required this.index});
}
