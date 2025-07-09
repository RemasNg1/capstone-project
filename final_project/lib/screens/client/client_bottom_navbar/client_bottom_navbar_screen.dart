import 'package:final_project/screens/client/client_bottom_navbar/bloc/client_bottom_navbar_bloc.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientBottomNavbarScreen extends StatelessWidget {
  const ClientBottomNavbarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientBottomNavbarBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ClientBottomNavbarBloc>();
          return BlocBuilder<ClientBottomNavbarBloc, ClientBottomNavbarState>(
            builder: (context, state) {
              double itemWidth = context.getWidth() / 4;
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
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    bottom: 110,
                    left: context.isArabic
                        ? null
                        : itemWidth * bloc.selectIndex,
                    right: context.isArabic
                        ? itemWidth * bloc.selectIndex
                        : null,
                    child: Container(
                      width: itemWidth,
                      height: 3,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
