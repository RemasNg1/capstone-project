part of 'client_profile_bloc.dart';

@immutable
sealed class ClientProfileState {}

final class ClientProfileInitial extends ClientProfileState {}

class LogoutSuccessState extends ClientProfileState {}

class LogoutFailureState extends ClientProfileState {
  final String error;

  LogoutFailureState(this.error);
}

class ClientProfileLoadedState extends ClientProfileState {
  final ClientModel user;

  ClientProfileLoadedState(this.user);
}

class ClientProfileUpdatingState extends ClientProfileState {}

class ClientProfileUpdatedState extends ClientProfileState {
  ClientProfileUpdatedState();
}

class ClientProfileUpdateFailedState extends ClientProfileState {
  final String error;

  ClientProfileUpdateFailedState(this.error);
}
