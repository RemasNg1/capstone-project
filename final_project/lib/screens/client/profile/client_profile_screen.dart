import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/screens/client/favorites/favorite_screen.dart';
import 'package:final_project/screens/client/profile/bloc/client_profile_bloc.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/widgets/avatar.dart';
import 'package:final_project/widgets/custom_list_tile.dart';
import 'package:final_project/widgets/info_dialog.dart';
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
                            builder: (context) => FavoriteScreen(),
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
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),

                    CustomListTile(
                      leadingIcon: SvgPicture.asset(
                        "assets/icons/light_mode.svg",
                      ),
                      title: "profile.mode".tr(),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
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
                          // TextStyle(
                          //   fontSize: 18,
                          //   fontWeight: FontWeight.w600,
                          // ),
                        ),
                      ],
                    ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     "profile.more".tr(),
                    //     style: AppTextStyles.interSize18(context).copyWith(
                    //       color: Theme.of(context).colorScheme.primary,
                    //     ),
                    //     // TextStyle(
                    //     //   fontSize: 18,
                    //     //   fontWeight: FontWeight.w600,
                    //     // ),
                    //   ),
                    // ),
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
                      // onTrailingTap: () {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => const InfoDialog(
                      //       title: "Support",
                      //       content:
                      //           "For Help and more Information\ncontact with us via email\n\nNote@gmail.com",
                      //     ),
                      //   );
                      // },
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

  // CustomListTile(
  //                     leadingIcon: Icon(Icons.support_agent_outlined),
  //                     title: "Support",
  //                     trailing: Icon(
  //                       Icons.keyboard_arrow_right_outlined,
  //                       color: Colors.black,
  //                     ),
  //                   ),

//  "profile": {
//         "title": "الملف الشخصي",
//         "system": "النظام",
//         "arabic": "العربية",
//         "favorite": "المفضلة",
//         "personalInfo": "المعلومات الشخصية",
//         "darkMode": "الوضع الليلي",
//         "more": "المزيد",
//         "paymentMethod": "طريقة الدفع",
//         "support": "الدعم",
//         "privacy": "سياسة الخصوصية",
//         "logout": "تسجيل الخروج",
//         "changeEmail": "تغيير البريد الإلكتروني",
//         "changePhone": "تغيير رقم الجوال",
//         "changePassword": "تغيير كلمة المرور",
//         "save": "حفظ",
//         "addMore": "إضافة المزيد"
//     },
  // onTrailingTap: () {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => const InfoDialog(
                      //       title: "Support",
                      //       content:
                      //           "For Help and more Information\ncontact with us via email\n\nNote@gmail.com",
                      //     ),
                      //   );
                      // },


                    // CustomListTile(
                    //   leadingIcon: Icons.support_agent_outlined,
                    //   title: "Support",
                    //   trailing: Icon(
                    //     Icons.keyboard_arrow_right_outlined,
                    //     color: Colors.black,
                    //   ),
                    //   onTrailingTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (context) => const InfoDialog(
                    //         title: "Support",
                    //         content:
                    //             "For Help and more Information\ncontact with us via email\n\nNote@gmail.com",
                    //       ),
                    //     );
                    //   },
                    // ),

                    // CustomListTile(
                    //   leadingIcon: Icons.logout_sharp,
                    //   title: "Logout",
                    //   trailing: Icon(
                    //     Icons.keyboard_arrow_right_outlined,
                    //     color: Colors.black,
                    //   ),
                    //   onTrailingTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (context) => BlocProvider.value(
                    //         value: bloc,
                    //         child: LogoutDialog(),
                    //       ),
                    //     );
                    //   },
                    // ),
                      // onTrailingTap: () {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => const InfoDialog(
                      //       title: "Support",
                      //       content:
                      //           "For Help and more Information\ncontact with us via email\n\nNote@gmail.com",
                      //     ),
                      //   );
                      // },
                       // onTrailingTap: () {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => const InfoDialog(
                      //       title: "Support",
                      //       content:
                      //           "For Help and more Information\ncontact with us via email\n\nNote@gmail.com",
                      //     ),
                      //   );
                      // },
                                                // color: AppColors.orange,
       // onTrailingTap: () {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => const InfoDialog(
                      //       title: "Support",
                      //       content:
                      //           "For Help and more Information\ncontact with us via email\n\nNote@gmail.com",
                      //     ),
                      //   );
                      // },
                        // onTrailingTap: () {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => const InfoDialog(
                      //       title: "Support",
                      //       content:
                      //           "For Help and more Information\ncontact with us via email\n\nNote@gmail.com",
                      //     ),
                      //   );
                      // },


                    // FutureBuilder<String?>(
                    //   future: SupabaseConnect.getUsername(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.connectionState ==
                    //         ConnectionState.waiting) {
                    //       return SizedBox.shrink();
                    //     } else if (snapshot.hasError) {
                    //       return Text('Error loading username');
                    //     } else if (!snapshot.hasData || snapshot.data == null) {
                    //       return Text('No username found');
                    //     } else {
                    //       return Text(
                    //         snapshot.data!,
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       );
                    //     }
                    //   },
                    // ),
                       // CustomListTile(
                    //   leadingIcon: Icons.edit_note_sharp,
                    //   title: "Edit personal information",
                    //   trailing: Icon(
                    //     Icons.keyboard_arrow_right_outlined,
                    //     color: Colors.black,
                    //   ),
                    //   onTrailingTap: () async {
                    //     final user = Supabase.instance.client.auth.currentUser;

                    //     final response = await Supabase.instance.client
                    //         .from('user_info')
                    //         .select('name')
                    //         .eq('authid', user!.id)
                    //         .maybeSingle();

                    //     bloc.nameController.text = response?['name'] ?? '';
                    //     bloc.passwordController.clear();

                    //     showDialog(
                    //       context: context,
                    //       builder: (context) => BlocProvider.value(
                    //         value: bloc,
                    //         child: EditInfoDialog(),
                    //       ),
                    //     );
                    //   },
                    // ),

                    // CustomListTile(
                    //   leadingIcon: Icons.notifications_none,
                    //   title: "Notification",
                    //   trailing: BlocBuilder<ProfileBloc, ProfileState>(
                    //     builder: (context, state) {
                    //       return InkWell(
                    //         onTap: () {
                    //           bloc.add(ChangeNotificationEvent());
                    //         },
                    //         child: AnimatedContainer(
                    //           duration: Duration(milliseconds: 200),
                    //           width: 60,
                    //           height: 28,
                    //           padding: EdgeInsets.symmetric(horizontal: 4),
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(20),
                    //             color: bloc.isEnable
                    //                 ? Colors.orange
                    //                 : Colors.grey.shade400,
                    //           ),
                    //           alignment: bloc.isEnable
                    //               ? Alignment.centerRight
                    //               : Alignment.centerLeft,
                    //           child: Container(
                    //             width: 20,
                    //             height: 20,
                    //             decoration: BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),