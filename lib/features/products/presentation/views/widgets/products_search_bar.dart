import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/barcode_widget.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductsSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onBarcodeScanned;

  const ProductsSearchBar({
    super.key,
    required this.onChanged,
    required this.onBarcodeScanned,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColorsDarkMode.border),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColorsDarkMode.textSecondary,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: AppStyles.bodyMediumRegular14(context),
              decoration: InputDecoration(
                hintText: S.of(context).searchByNameOrBarcode,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          BarcodeWidget(
            onTap: () async {
              final String? scanned = await context.push<String>(
                AppRoutes.barcodeScanner,
                extra: "search",
              );
              if (scanned != null) {
                onBarcodeScanned(scanned);
              }
            },
          ),
        ],
      ),
    );
  }
}
