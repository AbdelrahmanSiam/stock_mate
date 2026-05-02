import 'package:flutter/material.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_header_card.dart';

class SaleDetailViewBody extends StatelessWidget {
  const SaleDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SaleDetailHeaderCard(
            sale: SaleEntity(
              id: "1",
              invoiceNumber: "invoiceNumber",
              paymentMethod: "paymentMethod",
              totalAmount: 100,
              itemsCount: 2,
              items: [],
              createdAt: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}
