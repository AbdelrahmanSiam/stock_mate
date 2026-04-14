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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            ProductsViewHeader(),
            const SizedBox(height: 20),
            ProductsSearchBar(),
            const SizedBox(height: 20),
            ProductFilterChips(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProductCardWidget(
                    productEntity: ProductEntity(
                      id: "$index",
                      name: 'Product $index',
                      barcode: '123456789',
                      category: 'Category',
                      buyPrice: 10,
                      sellPrice: 15,
                      quantity: 50,
                      threshold: 10,
                      imageUrl:
                          "https://images.unsplash.com/photo-1523275335684-37898b6baf30",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}