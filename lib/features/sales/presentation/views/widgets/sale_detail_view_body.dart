import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_header_card.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_totals_section.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_purchased_item_list.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleDetailViewBody extends StatelessWidget {
  const SaleDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 32),
            Text(
              S.of(context).purchasedItems,
              style: AppStyles.labelSemiBold13(
                context,
              ).copyWith(color: AppColorsDarkMode.textSecondary),
            ),
            const SizedBox(height: 20),
            SalePurchasedItemList(),
            const SizedBox(height: 20),
            SaleDetailTotalsSection(totalAmount: 120), // sale.totalAmount
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {},
              isLoading: false,
              buttonName: S.of(context).exportPdf,
              iconButton: Icons.picture_as_pdf,
              changeColors: true,
            ),
          ],
        ),
      ),
    );
  }
}
