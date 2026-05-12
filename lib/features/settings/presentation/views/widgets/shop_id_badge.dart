import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class ShopIdBadge extends StatelessWidget {
  const ShopIdBadge({super.key, required this.shopId});

  final String shopId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.border,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'ID: $shopId',
        style: AppStyles.captionRegular10(context).copyWith(letterSpacing: 1),
      ),
    );
  }
}
