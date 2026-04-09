import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class ReceiptIcon extends StatelessWidget {
  const ReceiptIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorsDarkMode.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Icon(
          Icons.receipt_outlined,
          color: AppColorsDarkMode.primary,
          size: 20,
        ),
      ),
    );
  }
}
