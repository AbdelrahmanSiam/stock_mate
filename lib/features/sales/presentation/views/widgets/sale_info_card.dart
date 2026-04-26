import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/success_sale_items_section.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/success_sale_receipt_section.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/success_sale_total_amount_section.dart';

class SaleInfoCard extends StatelessWidget {
  final SaleEntity sale;

  const SaleInfoCard({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SuccessSaleTotalAmountSection(sale: sale),
          const SizedBox(height: 20),
          Divider(color: AppColorsDarkMode.border),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: SuccessSaleItemsSection(sale: sale)),
              Expanded(child: SuccessSaleReceiptSection(sale: sale)),
            ],
          ),
        ],
      ),
    );
  }
}
