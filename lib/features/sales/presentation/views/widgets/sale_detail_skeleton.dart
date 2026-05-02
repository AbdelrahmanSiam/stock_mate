import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'sale_detail_header_card.dart';
import 'sale_purchased_item_row.dart';

class SaleDetailSkeleton extends StatelessWidget {
  const SaleDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        highlightColor: Colors.grey,
        baseColor: Colors.black12,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SaleDetailHeaderCard(sale: SaleEntity.empty()),
            const SizedBox(height: 24),

            Container(width: 120, height: 12, color: AppColorsDarkMode.border),
            const SizedBox(height: 16),

            ...List.generate(
              3,
              (_) => Column(
                children: [
                  SalePurchasedItemRow(item: InvoiceItemEntity.empty()),
                  Divider(color: AppColorsDarkMode.border),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
