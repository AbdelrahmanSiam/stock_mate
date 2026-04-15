import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class StepperButton extends StatelessWidget {
  const StepperButton({super.key, required this.icon, this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: onTap != null
              ? AppColorsDarkMode.primary.withValues(alpha: 0.15)
              : AppColorsDarkMode.border,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 18,
          color: onTap != null
              ? AppColorsDarkMode.primary
              : AppColorsDarkMode.textSecondary,
        ),
      ),
    );
  }
}
