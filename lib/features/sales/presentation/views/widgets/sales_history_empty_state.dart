import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesHistoryEmptyState extends StatelessWidget {
  final bool isFiltered;

  const SalesHistoryEmptyState({
    super.key,
    this.isFiltered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size:  72,
              color: AppColorsDarkMode.textSecondary,
            ),
            const SizedBox(height: 20),
            Text(
              isFiltered
                  ? S.of(context).noSalesInPeriod
                  : S.of(context).noSalesYet,
              style:     AppStyles.sectionTitleSemiBold16(context),
              textAlign: TextAlign.center,
            ),
            if (!isFiltered) ...[
              const SizedBox(height: 8),
              Text(
                S.of(context).noSalesSubtitle,
                style:     AppStyles.bodySmallRegular12(context),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}