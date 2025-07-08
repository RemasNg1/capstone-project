import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/general/user_type/user_type_screen.dart';
import 'package:final_project/screens/service_provider/provider_profile/bloc/provider_profile_bloc.dart';
import 'package:final_project/screens/service_provider/provider_profile/edit_info.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/avatar.dart';
import 'package:final_project/widgets/custom_list_tile.dart';
import 'package:final_project/widgets/custom_switch.dart';
import 'package:final_project/widgets/dialog_with_two_options.dart';
import 'package:final_project/widgets/info_dialog.dart';
import 'package:final_project/widgets/legal_content_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProviderProfileScreen extends StatelessWidget {
  const ProviderProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProviderProfileBloc()..add(LoadProviderProfileEvent()),
      child: BlocConsumer<ProviderProfileBloc, ProviderProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserTypeScreen()),
            );
          } else if (state is LogoutFailureState) {
            Flushbar(
              messageText: Text(
                state.error,
                style: AppTextStyles.interSize16(
                  context,
                ).copyWith(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              icon: Icon(Icons.error, color: Colors.white),
              duration: Duration(seconds: 3),
              flushbarPosition: FlushbarPosition.BOTTOM,
              borderRadius: BorderRadius.circular(8),
              margin: EdgeInsets.all(16),
            ).show(context);
          } else if (state is ClientProfileUpdatedState) {
            Flushbar(
              messageText: Text(
                'تم تحديث المعلومات بنجاح',
                style: AppTextStyles.interSize16(
                  context,
                ).copyWith(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              icon: Icon(Icons.check_circle, color: Colors.white),
              duration: Duration(seconds: 3),
              flushbarPosition: FlushbarPosition.BOTTOM,
              borderRadius: BorderRadius.circular(8),
              margin: EdgeInsets.all(16),
            ).show(context);

            context.read<ProviderProfileBloc>().add(LoadProviderProfileEvent());
          } else if (state is ClientProfileUpdateFailedState) {
            Flushbar(
              messageText: Text(
                state.error,
                style: AppTextStyles.interSize16(
                  context,
                ).copyWith(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              icon: Icon(Icons.check_circle, color: Colors.white),
              duration: Duration(seconds: 3),
              flushbarPosition: FlushbarPosition.BOTTOM,
              borderRadius: BorderRadius.circular(8),
              margin: EdgeInsets.all(16),
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is ProviderProfileLoadedState) {
            final bloc = context.read<ProviderProfileBloc>();
            return Scaffold(
              appBar: AppBar(
                title: Text("profile.title".tr()),
                centerTitle: true,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Avatar(
                        imagePath:
                            state.user.avatar ??
                            'https://i.imgur.com/ZDM3MLB.png',
                        onEditTap: () {},
                      ),

                      AppSpacing.h16,

                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          state.user.nameEn!,
                          style: AppTextStyles.interSize16(context),
                        ),
                      ),
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
                        leadingIcon: SvgPicture.asset(
                          "assets/icons/edit.svg",
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimaryContainer,
                            BlendMode.srcIn,
                          ),
                        ),
                        title: "profile.personal_info".tr(),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: bloc,
                              child: EditInfoDialog(),
                            ),
                          );
                        },
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
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimaryContainer,
                            BlendMode.srcIn,
                          ),
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
                        leadingIcon: SvgPicture.asset(
                          "assets/icons/support.svg",
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimaryContainer,
                            BlendMode.srcIn,
                          ),
                        ),
                        title: "profile.support".tr(),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onTap: () {
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
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimaryContainer,
                            BlendMode.srcIn,
                          ),
                        ),
                        title: "profile.privacy".tr(),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            builder: (context) => LegalContentSheet(
                              title: 'profile.privacy'.tr(),
                              content: bloc.providerPrivacyKeys,
                            ),
                          );
                        },
                      ),
                      CustomListTile(
                        leadingIcon: SvgPicture.asset(
                          "assets/icons/logout.svg",
                          colorFilter: ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        ),
                        title: "profile.logout".tr(),
                        titleColor: Colors.red,
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => DialogWithTwoOptions(
                              title: "profile.logout_title".tr(),
                              message: "profile.logout_message".tr(),
                              cancelText: "profile.cancel".tr(),
                              confirmText: "profile.logout".tr(),
                              confirmButtonColor: Colors.red,
                              onConfirm: () {
                                bloc.add(LogoutEvent());
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
