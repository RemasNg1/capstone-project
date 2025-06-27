import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/general/onboarding/bloc/onboarding_bloc.dart';
import 'package:final_project/screens/general/user_type/user_type_screen.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<OnboardingBloc>();
          return Scaffold(
            body: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    PageView.builder(
                      controller: bloc.pageController,
                      itemCount: bloc.pages.length,
                      onPageChanged: (index) {
                        bloc.add(PageChangeEvent(index: index));
                      },
                      itemBuilder: (context, index) => bloc.pages[index],
                    ),

                    Positioned(
                      bottom: context.getHeight(factor: 0.20),
                      left: 0,
                      right: 0,

                      child: Center(
                        child: SmoothPageIndicator(
                          controller: bloc.pageController,
                          count: bloc.pages.length,
                          effect: SlideEffect(
                            dotHeight: 6,
                            dotWidth: context.getWidth(factor: 0.22),
                            dotColor: Theme.of(context).colorScheme.outline,
                            activeDotColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: context.getHeight(factor: 0.065),

                      child: Center(
                        child: ElevatedButton(
                          style: AppButtons.large,

                          onPressed: () {
                            if (bloc.pages.length - 1 == state.index) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserTypeScreen(),
                                ),
                              );
                            } else {
                              bloc.add(NextPageEvent());
                            }
                          },
                          child: Text(
                            (bloc.pages.length - 1 == state.index)
                                ? "onboarding3.get_started".tr()
                                : "onboardingNext".tr(),
                            style: AppTextStyles.interSize16(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
