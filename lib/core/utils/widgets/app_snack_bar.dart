import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

enum SnackBarType { success, error, warning, info }

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    required SnackBarType type ,
    Duration duration = const Duration(seconds: 3),
  }) {
    final Color borderColor = switch (type) {
      SnackBarType.success => AppColorsDarkMode.success,
      SnackBarType.error => AppColorsDarkMode.error,
      SnackBarType.warning => AppColorsDarkMode.secondary,
      SnackBarType.info => AppColorsDarkMode.primary,
    };

    final IconData icon = switch (type) {
      SnackBarType.success => Icons.check_circle_outline_rounded,
      SnackBarType.error => Icons.error_outline_rounded,
      SnackBarType.warning => Icons.warning_amber_rounded,
      SnackBarType.info => Icons.info_outline_rounded,
    };

    ScaffoldMessenger.of(context)
      // delete old snackbar
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColorsDarkMode.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColorsDarkMode.border, width: 1),
              boxShadow: [
                BoxShadow(
                  color: borderColor.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: borderColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),

                Icon(icon, color: borderColor, size: 22),
                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    message,
                    style: AppStyles.bodyMediumRegular14(
                      context,
                    ).copyWith(color: AppColorsDarkMode.textPrimary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
