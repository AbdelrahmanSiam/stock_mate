import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class CompletedBadge extends StatelessWidget {
  const CompletedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.success.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColorsDarkMode.success.withValues(alpha: 0.4),
        ),
      ),
      child: Text(
        S.of(context).completed,
        style: AppStyles.captionRegular10(context).copyWith(
          color: AppColorsDarkMode.success,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
