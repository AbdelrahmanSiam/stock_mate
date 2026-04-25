import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_search_bar.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onBarcodeScanned;

  const SaleSearchBar({
    super.key,
    required this.onChanged,
    required this.onBarcodeScanned,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(
      onChanged: onChanged,
      onBarcodeScanned: onBarcodeScanned,
      hintText: S.of(context).searchProductOrSku,
      barcodeScannerExtra: "sale",
    );
  }
}