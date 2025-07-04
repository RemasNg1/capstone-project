part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class LoadingState extends SplashState {}

final class SuccessLoadingState extends SplashState {}
