import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/presentation/manager/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class DashboardErrorView extends StatelessWidget {
  const DashboardErrorView({super.key, required this.errMessage});
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
          TextButton(
            onPressed: () => context.read<DashboardCubit>().getDashboardData(),
            child: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }
}
