part of 'provider_profile_bloc.dart';

@immutable
sealed class ProviderProfileState {}

final class ProviderProfileInitial extends ProviderProfileState {}

class LogoutSuccessState extends ProviderProfileState {}

class LogoutFailureState extends ProviderProfileState {
  final String error;

  LogoutFailureState(this.error);
}

class ProviderProfileLoadedState extends ProviderProfileState {
  final ProviderModel user;

  ProviderProfileLoadedState(this.user);
}

class ClientProfileUpdatingState extends ProviderProfileState {}

class ClientProfileUpdatedState extends ProviderProfileState {
  ClientProfileUpdatedState();
}

class ClientProfileUpdateFailedState extends ProviderProfileState {
  final String error;

  ClientProfileUpdateFailedState(this.error);
}
