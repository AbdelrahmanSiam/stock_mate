import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class SuccessCheckIcon extends StatelessWidget {
  const SuccessCheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColorsDarkMode.success,
        boxShadow: [
          BoxShadow(
            color: AppColorsDarkMode.success.withValues(alpha: 0.4),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Icon(Icons.check_rounded, color: Colors.white, size: 44),
      ),
    );
  }
}
