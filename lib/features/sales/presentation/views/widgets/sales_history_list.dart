import 'package:flutter/material.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_history_card.dart';

class SalesHistoryList extends StatelessWidget {
  const SalesHistoryList({super.key, required this.sale, required this.onTap});
  final SaleEntity sale;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SaleHistoryCard(sale: sale, onTap: onTap),
        );
      },
    );
  }
}
