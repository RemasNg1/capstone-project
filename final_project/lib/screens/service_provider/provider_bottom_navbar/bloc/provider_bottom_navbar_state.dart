part of 'provider_bottom_navbar_bloc.dart';

@immutable
sealed class ProviderBottomNavbarState {}

final class ProviderBottomNavbarInitial extends ProviderBottomNavbarState {}

final class SuccessState extends ProviderBottomNavbarState {}
