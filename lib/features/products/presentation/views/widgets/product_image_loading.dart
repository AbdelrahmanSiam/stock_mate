import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class ProductImageLoading extends StatelessWidget {
  const ProductImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColorsDarkMode.primary,
        strokeWidth: 2,
      ),
    );
  }
}
