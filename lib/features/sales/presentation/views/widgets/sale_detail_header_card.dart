import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/core/utils/widgets/completed_badge.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_payment_method_section.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_terminal_section.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_time_and_date_section.dart';

class SaleDetailHeaderCard extends StatelessWidget {
  final SaleEntity sale;

  const SaleDetailHeaderCard({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: SaleDateAndTimeSection(dateTime: sale.createdAt)),
              CompletedBadge(),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: AppColorsDarkMode.border),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SaleDetailPaymentMethodSection(
                  paymentMethod: sale.paymentMethod,
                ),
              ),
              Expanded(child: SaleDetailTerminalSection()),
            ],
          ),
        ],
      ),
    );
  }
}
