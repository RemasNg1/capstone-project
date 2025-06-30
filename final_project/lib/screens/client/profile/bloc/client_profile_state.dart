part of 'client_profile_bloc.dart';

@immutable
sealed class ClientProfileState {}

final class ClientProfileInitial extends ClientProfileState {}

class LogoutSuccessState extends ClientProfileState {}

class LogoutFailureState extends ClientProfileState {
  final String error;

  LogoutFailureState(this.error);
}
