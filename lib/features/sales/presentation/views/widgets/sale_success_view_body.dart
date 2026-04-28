import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_info_card.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_success_check_widget.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleSuccessViewBody extends StatelessWidget {
  const SaleSuccessViewBody({super.key, required this.sale});
  final SaleEntity sale;

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          SaleSuccessCheckWidget(),
          SizedBox(height: 20),
          Text(
            S.of(context).saleConfirmedSubtitle,
            style: AppStyles.h2Bold22(
              context,
            ).copyWith(color: AppColorsDarkMode.textSecondary),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          SaleInfoCard(sale: sale),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          CustomButton(
            iconButton: Icons.shopping_cart_outlined,
            onPressed: () => context.pushReplacement(AppRoutes.newSale),
            isLoading: false,
            buttonName: S.of(context).newSaleButton,
          ),
          SizedBox(height: 10),
          CustomButton(
            iconButton: Icons.dashboard_outlined,
            onPressed: () => context.go(AppRoutes.dashboard),
            isLoading: false,
            buttonName: S.of(context).goToDashboard,
            changeColors: true,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
