import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColorsDarkMode.surface,
          border: Border.all(color: AppColorsDarkMode.border, width: 1),
        ),
        child: const Icon(
          Icons.notifications_outlined,
          color: AppColorsDarkMode.textPrimary,
          size: 20,
        ),
      ),
    );
  }
}
