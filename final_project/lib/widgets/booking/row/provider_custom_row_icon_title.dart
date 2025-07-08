import 'package:flutter/material.dart';

class ProviderCustomRowIconTitle extends StatelessWidget {
  const ProviderCustomRowIconTitle({
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
        children: [
          icon,
          const SizedBox(width: 4),
          Text(title, overflow: TextOverflow.fade, softWrap: false),
        ],
      ),
    );
  }
}
