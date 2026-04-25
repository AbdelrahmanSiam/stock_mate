import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class NewSaleEmptyState extends StatelessWidget {
  const NewSaleEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined,
              size: 72, color: AppColorsDarkMode.textSecondary),
          const SizedBox(height: 20),
          Text(
            S.of(context).noItemsAdded,
            style: AppStyles.sectionTitleSemiBold16(context),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).noItemsSubtitle,
            style: AppStyles.bodySmallRegular12(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}