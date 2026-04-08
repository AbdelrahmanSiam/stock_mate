import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class SocialSignInButton extends StatelessWidget {
  const SocialSignInButton({super.key, this.onTap, required this.icon});
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: AppColorsDarkMode.surface,
          shape: BoxShape.circle,
          border: Border.all(color: AppColorsDarkMode.border, width: 1),
        ),
        child: Icon(icon, color: AppColorsDarkMode.textPrimary, size: 28),
      ),
    );
  }
}
