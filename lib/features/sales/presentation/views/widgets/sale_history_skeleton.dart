import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_history_card.dart';

class SaleHistorySkeleton extends StatelessWidget {
  const SaleHistorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, __) =>
            SaleHistoryCard(sale: SaleEntity.empty(), onTap: () {}),
      ),
    );
  }
}
