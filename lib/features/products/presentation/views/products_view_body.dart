import 'package:flutter/material.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_card_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_filter_chips.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_search_bar.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ProductsViewHeader(),
          const SizedBox(height: 30),
          ProductsSearchBar(),
          const SizedBox(height: 30),
          ProductFilterChips(),
          const SizedBox(height: 30),
          ProductCardWidget(
            productEntity: ProductEntity(
              id: "1",
              name: 'Product 1',
              barcode: '123456789',
              category: 'Category 1',
              buyPrice: 10.0,
              sellPrice: 15.0,
              quantity: 50,
              threshold: 10,
              imageUrl:"https://www.pexels.com/search/luxury%20watch/",
            ),
          ),
        ],
      );
  }
}
