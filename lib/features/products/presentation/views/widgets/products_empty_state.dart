import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductsEmptyState extends StatelessWidget {
  final bool isSearch;

  const ProductsEmptyState({super.key, this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSearch ? Icons.search_off_rounded : Icons.inventory_2_outlined,
              size: 72,
              color: AppColorsDarkMode.textSecondary,
            ),
            const SizedBox(height: 20),
            Text(
              isSearch
                  ? S.of(context).noSearchResults
                  : S.of(context).noProductsYet,
              style: AppStyles.sectionTitleSemiBold16(context),
              textAlign: TextAlign.center,
            ),
            if (!isSearch) ...[
              const SizedBox(height: 8),
              Text(
                S.of(context).noProductsYetSubtitle,
                style: AppStyles.bodySmallRegular12(context),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
