import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_filter_chips.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_search_bar.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProductsViewHeader(),
          const SizedBox(height: 30),
          ProductsSearchBar(),
          const SizedBox(height: 30),
          ProductFilterChips(),

        ],
      ),
    );
  }
}
