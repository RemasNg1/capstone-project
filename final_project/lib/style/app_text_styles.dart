import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle title(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle interSize11(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 11, fontWeight: FontWeight.w500);

  static TextStyle interSize12(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 12, fontWeight: FontWeight.w600);

  static TextStyle interSize14(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle interSize16(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle interSize18(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w600);

  static TextStyle interSize20(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle interSize24(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 24, fontWeight: FontWeight.w600);

  static TextStyle interSize26(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 26, fontWeight: FontWeight.w700);

  static TextStyle interSize28(BuildContext context) => Theme.of(
    context,
  ).textTheme.bodyMedium!.copyWith(fontSize: 28, fontWeight: FontWeight.w600);
}
