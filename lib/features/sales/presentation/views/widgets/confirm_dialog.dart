import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.state,
    required this.onConfirm,
  });

  final SaleItemsUpdatedState state;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColorsDarkMode.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).confirmSaleTitle,
            style: AppStyles.priceBold16(
              context,
            ).copyWith(color: AppColorsDarkMode.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            S
                .of(context)
                .confirmSaleMessage(
                  state.totalItemsCount,
                  state.subTotal.toStringAsFixed(2),
                ),
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColorsDarkMode.textSecondary),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(S.of(context).cancel),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onConfirm();
                  },
                  child: Text(S.of(context).confirmSale),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
