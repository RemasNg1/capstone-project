part of 'provider_profile_bloc.dart';

@immutable
sealed class ProviderProfileState {}

final class ProviderProfileInitial extends ProviderProfileState {}

class LogoutSuccessState extends ProviderProfileState {}

class LogoutFailureState extends ProviderProfileState {
  final String error;

  LogoutFailureState(this.error);
}
