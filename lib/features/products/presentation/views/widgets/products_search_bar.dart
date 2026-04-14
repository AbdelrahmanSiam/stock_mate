import 'package:flutter/material.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductsSearchBar extends StatelessWidget {
  const ProductsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: S.of(context).searchByNameOrBarcode,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.qr_code_scanner_outlined),
      ),
    );
  }
}
