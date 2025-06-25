import 'package:final_project/screens/general/onboarding/onboarding_screen.dart';
import 'package:final_project/screens/general/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: Builder(
        builder: (context) {
          context.read<SplashBloc>().add(SkipIntroEvent());
          return BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SuccessLoadingState) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  (value) => false,
                );
              }
            },
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primary,
              body: Center(
                child: Image.asset(
                  "assets/images/logo_white.png",
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
