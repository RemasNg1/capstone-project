import 'package:final_project/screens/client/client_bottom_navbar/client_bottom_navbar_screen.dart';
import 'package:final_project/screens/general/onboarding/onboarding_screen.dart';
import 'package:final_project/screens/general/splash/bloc/splash_bloc.dart';
import 'package:final_project/screens/service_provider/provider_bottom_navbar/provider_bottom_navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SkipIntroEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is UserLoggedInAsClientState ||
              state is UserLoggedInAsAnonymousState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ClientBottomNavbarScreen(),
              ),
              (value) => false,
            );
          } else if (state is UserLoggedInAsProviderState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ProviderBottomNavbarScreen(),
              ),
              (value) => false,
            );
          } else if (state is UserNotLoggedInState) {
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
      ),
    );
  }
}
