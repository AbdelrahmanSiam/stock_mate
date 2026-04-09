import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/alert_badge.dart';

class StatCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color valueColor;
  final bool showAlertBadge;
  final void Function()? onTap;

  const StatCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.valueColor = AppColorsDarkMode.textPrimary,
    this.showAlertBadge = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColorsDarkMode.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColorsDarkMode.border, width: 1),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: showAlertBadge
                      ? AppColorsDarkMode.error
                      : AppColorsDarkMode.primary,
                  size: 22,
                ),
                if (showAlertBadge) AlertBadge(),
              ],
            ),
            const SizedBox(height: 12),
            Text(title, style: AppStyles.bodySmallRegular12(context)),
            const SizedBox(height: 24),
            Text(
              value,
              style: AppStyles.h2Bold22(context).copyWith(color: valueColor),
            ),
          ],
        ),
      ),
    );
  }
}
