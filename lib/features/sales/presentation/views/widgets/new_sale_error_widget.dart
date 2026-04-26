import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class NewSaleErrorWidget extends StatelessWidget {
  const NewSaleErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColorsDarkMode.error,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(errMessage),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<SaleCubit>().init(),
            child: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }
}
