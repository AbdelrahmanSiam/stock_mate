import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class ProductFilterChip extends StatelessWidget {
  const ProductFilterChip({
    super.key,
    required this.isActive,
    required this.filterChipName,
  });
  final bool isActive;
  final String filterChipName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsets.only(right: 32),
      decoration: BoxDecoration(
        color: isActive ? AppColorsDarkMode.primary : AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive
              ? AppColorsDarkMode.primary
              : AppColorsDarkMode.border,
          width: 1,
        ),
      ),
      child: Text(
        filterChipName,
        style: AppStyles.bodySmallRegular12(context).copyWith(
          color: isActive
              ? AppColorsDarkMode.background
              : AppColorsDarkMode.textSecondary,
        ),
      ),
    );
  }
}
