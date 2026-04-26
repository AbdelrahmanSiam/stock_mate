import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_card_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_empty_state.dart';

class ProductsViewContent extends StatelessWidget {
  const ProductsViewContent({super.key, required this.state});
  final ProductsState state;

  @override
  Widget build(BuildContext context) {
    final currentState = state as ProductsSuccessState;
    if (currentState.allProducts.isEmpty) {
      return SliverToBoxAdapter(
        child: ProductsEmptyState(isSearch: false),
      );
    }
    if (currentState.filteredProducts.isEmpty) {
      return SliverToBoxAdapter(
        child: ProductsEmptyState(isSearch: true),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final product = currentState.filteredProducts[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () {
              context.push(AppRoutes.addEditProducts, extra: product);
            },
            child: ProductCardWidget(
              productEntity: product,
            ),
          ),
        );
      }, childCount: currentState.filteredProducts.length),
    );
  }
}
