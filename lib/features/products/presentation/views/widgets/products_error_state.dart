import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductsErrorState extends StatelessWidget {
  final String message;
  const ProductsErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColorsDarkMode.error,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: AppStyles.bodyMediumRegular14(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<ProductsCubit>().getProducts(),
              child: Text(S.of(context).retry),
            ),
          ],
        ),
      ),
    );
  }
}
