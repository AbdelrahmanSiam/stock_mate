import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class ProductImageLoading extends StatelessWidget {
  final double? strokeWidth;
  const ProductImageLoading({super.key, this.strokeWidth = 2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColorsDarkMode.primary,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
