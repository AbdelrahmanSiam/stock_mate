import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.qr_code_scanner,
        color: AppColorsDarkMode.primary,
        size: 22,
      ),
    );
  }
}
