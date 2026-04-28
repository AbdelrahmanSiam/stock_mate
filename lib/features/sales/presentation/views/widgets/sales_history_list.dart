import 'package:flutter/material.dart';
import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/recent_sale_card_widget.dart';

class SalesHistoryList extends StatelessWidget {
  const SalesHistoryList({super.key, required this.sale});
  final RecentSaleEntity sale;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RecentSaleCardWidget(showCompletedBadge: true, sale: sale),
        );
      },
    );
  }
}
