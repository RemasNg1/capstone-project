part of 'client_profile_bloc.dart';

@immutable
sealed class ClientProfileEvent {}

class LogoutEvent extends ClientProfileEvent {}
