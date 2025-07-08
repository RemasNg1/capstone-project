import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomListTile extends StatelessWidget {
  final SvgPicture leadingIcon;
  final Color leadingIconColor;
  final String title;
  final Color? titleColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.leadingIcon,
    this.leadingIconColor = Colors.black,
    required this.title,
    this.titleColor,
    this.trailing,
    this.onTap,
  });

  // A customizable ListTile widget with leading icon, title, optional trailing widget, and tap handling on the trailing area.

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: leadingIcon,
        title: Text(
          title,
          style: TextStyle(
            color: titleColor ?? Theme.of(context).colorScheme.onSurface,
          ),
        ),
        trailing: trailing,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
