import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/favorites/favorites_screen.dart';
import 'package:final_project/screens/client/profile/bloc/client_profile_bloc.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/avatar.dart';
import 'package:final_project/widgets/custom_list_tile.dart';
import 'package:final_project/widgets/custom_switch.dart';
import 'package:final_project/widgets/info_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientProfileScreen extends StatelessWidget {
  const ClientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientProfileBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<ClientProfileBloc>();
          return Scaffold(
            appBar: AppBar(title: Text("Profile"), centerTitle: true),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Avatar(imagePath: 'assets/images/entry.png'),

                    AppSpacing.h16,

                    AppSpacing.h32,
                    Row(
                      children: [
                        Text(
                          "profile.account_settings".tr(),
                          style: AppTextStyles.interSize18(context).copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    CustomListTile(
                      leadingIcon: SvgPicture.asset("assets/icons/edit.svg"),
                      title: "profile.personal_info".tr(),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                    CustomListTile(
                      leadingIcon: SvgPicture.asset(
                        "assets/icons/favorite.svg",
                      ),
                      title: "profile.favorite".tr(),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTrailingTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoritesScreen(),
                          ),
                        );
                      },
                    ),
                    CustomListTile(
                      leadingIcon: SvgPicture.asset("assets/icons/card.svg"),
                      title: "profile.payment_method".tr(),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                    AppSpacing.h8,
                    Row(
                      children: [
                        Text(
                          "profile.preferences".tr(),
                          style: AppTextStyles.interSize18(context).copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),

                    CustomListTile(
                      leadingIcon: SvgPicture.asset(
                        "assets/icons/language.svg",
                      ),
                      title: "profile.language".tr(),

                      trailing: CustomSwitch(
                        value: context.locale.languageCode == 'en',
                        activeText: 'AR',
                        inactiveText: 'EN',
                        activeIcon: Icon(CupertinoIcons.globe),
                        inactiveIcon: Icon(CupertinoIcons.globe),
                        onToggle: (val) {
                          context.setLocale(
                            val ? Locale('en', 'US') : Locale('ar', 'AR'),
                          );
                        },
                      ),
                    ),

                    CustomListTile(
                      leadingIcon: SvgPicture.asset(
                        "assets/icons/mode.svg",
                        width: 28,
                      ),
                      title: "profile.mode".tr(),
                      trailing: CustomSwitch(
                        value: true,
                        activeIcon: SvgPicture.asset(
                          'assets/icons/light_mode.svg',
                        ),
                        inactiveIcon: SvgPicture.asset(
                          'assets/icons/dark_mode.svg',
                        ),
                        onToggle: (val) {
                          // context.setLocale(
                          //   val ? Locale('en', 'US') : Locale('ar', 'AR'),
                          // );
                        },
                      ),
                    ),
                    AppSpacing.h8,
                    Row(
                      children: [
                        Text(
                          "profile.more".tr(),
                          style: AppTextStyles.interSize18(context).copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),

                    CustomListTile(
                      leadingIcon: SvgPicture.asset("assets/icons/support.svg"),
                      title: "profile.support".tr(),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                      onTrailingTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => InfoDialog(
                            title: "profile.support".tr(),
                            content: "profile.contact_us".tr(),
                            email: 'tajammal.team@gmail.com',
                          ),
                        );
                      },
                    ),

                    CustomListTile(
                      leadingIcon: SvgPicture.asset(
                        "assets/icons/privacy_policy.svg",
                      ),
                      title: "profile.privacy".tr(),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                    CustomListTile(
                      leadingIcon: SvgPicture.asset("assets/icons/logout.svg"),
                      title: "profile.logout".tr(),
                      titleColor: Colors.red,
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
