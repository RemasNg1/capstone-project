import 'package:final_project/screens/service_provider/provider_bottom_navbar/bloc/provider_bottom_navbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProviderBottomNavbarScreen extends StatelessWidget {
  const ProviderBottomNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderBottomNavbarBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ProviderBottomNavbarBloc>();
          return BlocBuilder<
            ProviderBottomNavbarBloc,
            ProviderBottomNavbarState
          >(
            builder: (context, state) {
              // double itemWidth = context.getWidth() / 4;
              return Stack(
                children: [
                  Scaffold(
                    bottomNavigationBar: NavigationBarTheme(
                      data: NavigationBarThemeData(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primaryContainer,
                      ),
                      child: NavigationBar(
                        selectedIndex: bloc.selectIndex,
                        onDestinationSelected: (value) {
                          bloc.add(NavSelectionEvent(index: value));
                        },

                        indicatorColor: Colors.transparent,
                        destinations: [
                          NavigationDestination(
                            label: "",
                            icon: SvgPicture.asset(
                              'assets/icons/home.svg',
                              colorFilter: ColorFilter.mode(
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                BlendMode.srcIn,
                              ),
                            ),
                            selectedIcon: SvgPicture.asset(
                              'assets/icons/fill_home.svg',
                            ),
                          ),
                          NavigationDestination(
                            label: "",
                            icon: SvgPicture.asset(
                              'assets/icons/calendar.svg',
                              colorFilter: ColorFilter.mode(
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                BlendMode.srcIn,
                              ),
                            ),
                            selectedIcon: SvgPicture.asset(
                              'assets/icons/fill_calendar.svg',
                            ),
                          ),
                          NavigationDestination(
                            label: "",
                            icon: SvgPicture.asset(
                              'assets/icons/add.svg',
                              colorFilter: ColorFilter.mode(
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                BlendMode.srcIn,
                              ),
                            ),
                            selectedIcon: SvgPicture.asset(
                              'assets/icons/fill_add.svg',
                            ),
                          ),
                          NavigationDestination(
                            label: "",
                            icon: SvgPicture.asset(
                              'assets/icons/chat.svg',
                              colorFilter: ColorFilter.mode(
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                BlendMode.srcIn,
                              ),
                            ),
                            selectedIcon: SvgPicture.asset(
                              'assets/icons/fill_chat.svg',
                            ),
                          ),
                          NavigationDestination(
                            label: "",
                            icon: SvgPicture.asset(
                              'assets/icons/profile.svg',
                              colorFilter: ColorFilter.mode(
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                                BlendMode.srcIn,
                              ),
                            ),
                            selectedIcon: SvgPicture.asset(
                              'assets/icons/fill_profile.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: bloc.screens[bloc.selectIndex],
                  ),
                  // Positioned(
                  //   bottom: 110,
                  //   left: itemWidth * bloc.selectIndex,
                  //   child: Container(
                  //     width: itemWidth,
                  //     height: 3,
                  //     color: Theme.of(context).colorScheme.primary,
                  //   ),
                  // ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
