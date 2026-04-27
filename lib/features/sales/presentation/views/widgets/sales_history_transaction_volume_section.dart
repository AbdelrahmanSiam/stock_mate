import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesHistoryTransactionVolumeSection extends StatelessWidget {
  const SalesHistoryTransactionVolumeSection({
    super.key,
    required this.totalSales,
  });
  final int totalSales;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).transactionVolume,
          style: AppStyles.bodySmallRegular12(context),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text("$totalSales", style: AppStyles.appNameBold32(context)),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                S.of(context).sales,
                style: AppStyles.bodySmallRegular12(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
