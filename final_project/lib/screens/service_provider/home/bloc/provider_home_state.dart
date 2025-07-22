part of 'provider_home_bloc.dart';

@immutable
sealed class ProviderHomeState {}

final class ProviderHomeInitial extends ProviderHomeState {}

final class ChangeDataViewSuccessful extends ProviderHomeState {}


class LoadDataSuccessfully extends ProviderHomeState{}
class Error extends ProviderHomeState{}