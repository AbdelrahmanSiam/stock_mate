import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_summary_card.dart';

class SalesSummaryCardSkeletonizer extends StatelessWidget {
  const SalesSummaryCardSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: const ShimmerEffect(
        highlightColor: Colors.grey,
        baseColor: Colors.black12,
      ),
      child: SalesSummaryCard(totalSales: 24, grossRevenue: 4200),
    );
  }
}
