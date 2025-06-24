part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class PageChangeEvent extends OnboardingEvent {
  final int index;

  PageChangeEvent({required this.index});
}

class NextPageEvent extends OnboardingEvent {}

class PreviousPageEvent extends OnboardingEvent {}
