part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class LoadingState extends SplashState {}

final class SuccessLoadingState extends SplashState {}

class UserLoggedInAsClientState extends SplashState {}

class UserLoggedInAsProviderState extends SplashState {}

class UserLoggedInAsAnonymousState extends SplashState {}

class UserNotLoggedInState extends SplashState {}
