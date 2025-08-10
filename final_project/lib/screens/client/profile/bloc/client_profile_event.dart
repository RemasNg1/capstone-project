part of 'client_profile_bloc.dart';

@immutable
sealed class ClientProfileEvent {}

class LogoutEvent extends ClientProfileEvent {}

class LoadClientProfileEvent extends ClientProfileEvent {}

class UpdateProfileInfoEvent extends ClientProfileEvent {
  final String name;
  final String phone;

  UpdateProfileInfoEvent({required this.name, required this.phone});
}

class UpdateAvatarEvent extends ClientProfileEvent {
  final String avatarUrl;
  UpdateAvatarEvent(this.avatarUrl);
}
