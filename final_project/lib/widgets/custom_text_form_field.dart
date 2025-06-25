// import 'package:flutter/material.dart';

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.labelText,
//     this.onChanged,
//     this.isDescription = false,
//     this.initialValue,
//   });
//   final String labelText;
//   final String? initialValue;
//   final bool isDescription;
//   final Function(String text)? onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       // maxLines: isDescription ? 16 : 3,
//       // minLines: isDescription ? 8 : 1,
//       onChanged: onChanged,
//       initialValue: initialValue,
//       decoration: InputDecoration(
//         // filled: true,
//         // fillColor: AppColors.grayTransparent,
//         labelText: labelText,
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Widget? icon;
  final bool obscureText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.onChanged,

    this.suffixIcon,
    this.controller,
    this.validator,
  });

  // A reusable styled text field widget with customizable icon, hint, validation, and optional password obscuring.

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon,
        prefixIconColor: Theme.of(context).colorScheme.primary,
        //  Icon(icon, color: Theme.of(context).colorScheme.primary),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(15),
        ),
        //        // contentPadding: const EdgeInsets.symmetric(
        //   horizontal: 16,
        //   vertical: 12,
        // ),
      ),
    );
  }
}
