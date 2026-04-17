import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class ProductSheetHandle extends StatelessWidget {
  const ProductSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.border,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}