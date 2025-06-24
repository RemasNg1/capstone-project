import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/widgets/content_of_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController = PageController();
  final List<Widget> pages = [
    ContentOfOnboarding(
      description: "onboarding1.subtitle",
      title: "onboarding1.title",
      imagePath: "assets/images/onboarding-1.png",
    ),
    ContentOfOnboarding(
      description: "onboarding2.subtitle",
      title: "onboarding2.title",
      imagePath: "assets/images/onboarding-2.png",
    ),

    ContentOfOnboarding(
      description: "onboarding3.subtitle",
      title: "onboarding3.title",
      imagePath: "assets/images/onboarding-3.png",
    ),
  ];

  OnboardingBloc() : super(OnboardingInitial()) {
    on<NextPageEvent>(changeMethod);

    on<PreviousPageEvent>((event, emit) {
      if (state.index > 0) {
        pageController.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        emit(SuccessState(index: state.index - 1));
      }
    });

    on<PageChangeEvent>((event, emit) {
      emit(SuccessState(index: event.index));
    });
  }

  FutureOr<void> changeMethod(
    NextPageEvent event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.index < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      emit(SuccessState(index: state.index + 1));
    }
  }
}
