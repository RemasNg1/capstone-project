// import 'package:easy_localization/easy_localization.dart';
// import 'package:final_project/style/app_buttons.dart';
// import 'package:final_project/style/app_spacing.dart';
// import 'package:final_project/style/app_text_styles.dart';
// import 'package:flutter/material.dart';

// class HomeeScreen extends StatelessWidget {
//   const HomeeScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home")),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {},
//                 style: AppButtons.small,
//                 child: Text(
//                   'home.hello'.tr(),
//                   style: AppTextStyles.interSize16(context),
//                 ),
//               ),
//               AppSpacing.h16,
//               ElevatedButton(
//                 onPressed: () {},
//                 style: AppButtons.medium,
//                 child: Text(
//                   'userType.customer'.tr(),
//                   style: AppTextStyles.interSize16(context),
//                 ),
//               ),
//               AppSpacing.h16,
//               ElevatedButton(
//                 onPressed: () {
//                   context.setLocale(
//                     Locale('ar', 'AR') == context.locale
//                         ? Locale('en', 'US')
//                         : Locale('ar', 'AR'),
//                   );
//                 },
//                 style: AppButtons.large,
//                 child: Text(
//                   'home.change_language'.tr(),
//                   style: AppTextStyles.interSize16(context),
//                 ),
//               ),
//               AppSpacing.h24,
//               Text(
//                 "interSize11",
//                 style: AppTextStyles.interSize11(
//                   context,
//                 ).copyWith(color: Theme.of(context).colorScheme.onSecondary),
//               ),
//               AppSpacing.h16,
//               Text("interSize12", style: AppTextStyles.interSize12(context)),
//               AppSpacing.h16,
//               Text("interSize14", style: AppTextStyles.interSize14(context)),
//               AppSpacing.h16,
//               Text(
//                 "interSize16",
//                 style: AppTextStyles.interSize16(
//                   context,
//                 ).copyWith(color: Theme.of(context).colorScheme.primary),
//               ),
//               AppSpacing.h16,
//               Text("interSize18", style: AppTextStyles.interSize18(context)),
//               AppSpacing.h16,
//               Text("interSize20", style: AppTextStyles.interSize20(context)),
//               AppSpacing.h16,
//               Text("interSize24", style: AppTextStyles.interSize24(context)),
//               AppSpacing.h16,
//               AppSpacing.h16,
//               Text("interSize26", style: AppTextStyles.interSize26(context)),
//               AppSpacing.h16,
//               Text("interSize28", style: AppTextStyles.interSize28(context)),
//               AppSpacing.h16,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
