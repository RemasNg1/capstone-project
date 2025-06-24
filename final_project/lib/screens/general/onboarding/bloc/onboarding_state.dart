part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {
  final int index;

  const OnboardingState({this.index = 0});
}

final class OnboardingInitial extends OnboardingState {}

final class SuccessState extends OnboardingState {
  final int index;

  const SuccessState({this.index = 0});
}
