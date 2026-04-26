import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_success_check_widget.dart';

class SaleSuccessViewBody extends StatelessWidget {
  const SaleSuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SaleSuccessCheckWidget(),
        ],
      ),
    );
  }
}
