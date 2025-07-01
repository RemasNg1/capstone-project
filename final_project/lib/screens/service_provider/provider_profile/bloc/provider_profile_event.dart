part of 'provider_profile_bloc.dart';

@immutable
sealed class ProviderProfileEvent {}

class LogoutEvent extends ProviderProfileEvent {}
