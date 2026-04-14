import 'package:flutter/material.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_filter_chip.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductFilterChips extends StatefulWidget {
  const ProductFilterChips({super.key});

  @override
  State<ProductFilterChips> createState() => _ProductFilterChipsState();
}

class _ProductFilterChipsState extends State<ProductFilterChips> {
  int activeFilter = 0;
  static List<String> filterList = [
    S.current.all,
    S.current.lowStock,
    S.current.outOfStock,
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filterList.asMap().entries.map((e) {
          int index = e.key;
          String filter = e.value;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeFilter = index;
                });
              },
              child: ProductFilterChip(
                isActive: activeFilter == index,
                filterChipName: filter,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
