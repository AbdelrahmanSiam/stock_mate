import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class TotalRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTotal;

  const TotalRow({
    super.key,
    required this.label,
    required this.value,
    required this.isTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppStyles.sectionTitleSemiBold16(context)
              : AppStyles.bodyMediumRegular14(context),
        ),
        Text(
          value,
          style: isTotal
              ? AppStyles.h2Bold22(context).copyWith(
                  color: AppColorsDarkMode.primary,
                  fontSize: getResponsiveFontSize(context, fontSize: 28),
                )
              : AppStyles.bodyMediumRegular14(
                  context,
                ).copyWith(color: AppColorsDarkMode.textPrimary),
        ),
      ],
    );
  }
}
