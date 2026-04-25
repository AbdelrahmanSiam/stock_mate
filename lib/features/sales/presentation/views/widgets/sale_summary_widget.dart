import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/payment_method_selector.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/summary_row.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleSummaryWidget extends StatelessWidget {
  final SaleItemsUpdatedState state;
  final VoidCallback onConfirm;

  const SaleSummaryWidget({
    super.key,
    required this.state,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        border: Border(
          top: BorderSide(color: AppColorsDarkMode.border, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodSelector(
            selected: state.paymentMethod,
            onChanged: (method) =>
                context.read<SaleCubit>().setPaymentMethod(method),
          ),
          const SizedBox(height: 16),

          SummaryRow(
            label: S.of(context).items,
            value: '${state.totalItemsCount}',
          ),
          const SizedBox(height: 8),

          SummaryRow(
            label: S.of(context).subtotal,
            value: '${state.subTotal.toStringAsFixed(2)} ${S.of(context).egp}',
          ),
          const SizedBox(height: 12),

          Divider(color: AppColorsDarkMode.border),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).total,
                style: AppStyles.sectionTitleSemiBold16(context),
              ),
              Text(
                '${state.subTotal.toStringAsFixed(2)} ${S.of(context).egp}',
                style: AppStyles.h2Bold22(
                  context,
                ).copyWith(color: AppColorsDarkMode.primary),
              ),
            ],
          ),
          const SizedBox(height: 16),

          CustomButton(
            buttonName: S.of(context).confirmSale,
            isLoading: false,
            onPressed: state.isEmpty ? null : onConfirm,
          ),
        ],
      ),
    );
  }
}
