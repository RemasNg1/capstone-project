part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

class SkipIntroEvent extends SplashEvent {}
