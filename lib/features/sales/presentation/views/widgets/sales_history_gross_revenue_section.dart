import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesHistoryGrossRevenueSection extends StatelessWidget {
  const SalesHistoryGrossRevenueSection({
    super.key,
    required this.grossRevenue,
  });
  final double grossRevenue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).grossRevenue,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: AppColorsDarkMode.primary),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              '${grossRevenue.toStringAsFixed(0)}',
              style: AppStyles.appNameBold32(
                context,
              ).copyWith(color: AppColorsDarkMode.primary),
            ),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                S.of(context).egp,
                style: AppStyles.bodySmallRegular12(
                  context,
                ).copyWith(color: AppColorsDarkMode.primary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
