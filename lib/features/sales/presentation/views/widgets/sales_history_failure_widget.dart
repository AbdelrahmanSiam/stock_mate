import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sales_history_cubit/sales_history_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesHistoryFailureWidget extends StatelessWidget {
  const SalesHistoryFailureWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Icon(
            Icons.error_outline,
            color: AppColorsDarkMode.error,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(errMessage, style: AppStyles.bodyMediumRegular14(context)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<SalesHistoryCubit>().getRecentSales(),
            child: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }
}
