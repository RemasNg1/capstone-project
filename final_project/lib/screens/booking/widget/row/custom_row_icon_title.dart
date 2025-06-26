import 'package:flutter/material.dart';

class CustomRowIconTitle extends StatelessWidget {
  const CustomRowIconTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final Widget icon;
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        spacing: 4,
        children: [
          icon,
          Text(title, overflow: TextOverflow.fade, softWrap: false),
        ],
      ),
    );
  }
}
