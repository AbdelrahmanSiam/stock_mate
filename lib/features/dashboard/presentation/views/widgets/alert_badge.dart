import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class AlertBadge extends StatelessWidget {
  const AlertBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.error.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColorsDarkMode.error.withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Text(
        S.of(context).alert,
        style: AppStyles.captionRegular10(
          context,
        ).copyWith(color: AppColorsDarkMode.error, fontWeight: FontWeight.w600),
      ),
    );
  }
}
