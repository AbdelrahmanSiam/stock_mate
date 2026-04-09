import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class WeeklySalesChartHeader extends StatelessWidget {
  const WeeklySalesChartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).weeklySalesChartTitle,
          style: AppStyles.sectionTitleSemiBold16(context),
        ),
        Text(
          S.of(context).allDays,
          style: AppStyles.bodySmallRegular12(
            context,
          ).copyWith(color: AppColorsDarkMode.primary),
        ),
      ],
    );
  }
}
