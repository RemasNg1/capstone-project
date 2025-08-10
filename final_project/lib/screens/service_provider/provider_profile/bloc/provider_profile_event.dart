part of 'provider_profile_bloc.dart';

@immutable
sealed class ProviderProfileEvent {}

class LogoutEvent extends ProviderProfileEvent {}

class LoadProviderProfileEvent extends ProviderProfileEvent {}

class UpdateProfileInfoEvent extends ProviderProfileEvent {
  final String nameAr;
  final String nameEn;
  final String crNumber;
  final String iban;

  final String phone;

  UpdateProfileInfoEvent({
    required this.nameAr,
    required this.nameEn,
    required this.crNumber,
    required this.iban,
    required this.phone,
  });
}

class UpdateAvatarEvent extends ProviderProfileEvent {
  final String avatarUrl;
  UpdateAvatarEvent(this.avatarUrl);
}
