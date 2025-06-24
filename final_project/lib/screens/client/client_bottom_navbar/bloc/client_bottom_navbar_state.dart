part of 'client_bottom_navbar_bloc.dart';

@immutable
sealed class ClientBottomNavbarState {}

final class ClientBottomNavbarInitial extends ClientBottomNavbarState {}

final class SuccessState extends ClientBottomNavbarState {}
