import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class NotifictationEmpty extends StatelessWidget {
  const NotifictationEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.notifications_none_rounded,
            size: 56,
            color: AppColorsDarkMode.textSecondary,
          ),
          const SizedBox(height: 12),
          Text(
            S.of(context).no_notifications,
            style: AppStyles.bodyMediumRegular14(context),
          ),
        ],
      ),
    );
  }
}
