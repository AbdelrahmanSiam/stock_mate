
import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class DashboardAvatar extends StatelessWidget {
  const DashboardAvatar({
    super.key,
    required this.displayName,
  });

  final String displayName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColorsDarkMode.surface,
        border: Border.all(
          color: AppColorsDarkMode.border,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          displayName.isNotEmpty
              ? displayName[0].toUpperCase()
              : '0',
          style: AppStyles.sectionTitleSemiBold16(context).copyWith(
            color: AppColorsDarkMode.primary,
          ),
        ),
      ),
    );
  }
}