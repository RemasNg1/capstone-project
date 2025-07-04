import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldService extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextFormFieldService({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.suffixIcon,
    this.onSuffixTap,
    this.readOnly = false,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.h8,
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: readOnly,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.mediumGray,
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.lightGray),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.lightGray),
            ),
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onSuffixTap,
                    child: Icon(suffixIcon, color: AppColors.mediumGray),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
