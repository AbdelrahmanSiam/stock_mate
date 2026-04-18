import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';

List<ProductEntity> applyFilters({
  required List<ProductEntity> products,
  required ProductFilter filter,
  required String query,
}) {
  List<ProductEntity> filteredProducts = products;
  filteredProducts = switch (filter) {
    ProductFilter.all => filteredProducts,
    ProductFilter.lowStock =>
      filteredProducts.where(((p) => p.isLowStock)).toList(),
    ProductFilter.outOfStock =>
      filteredProducts.where(((p) => p.isOutOfStock)).toList(),
  };
  if (query.isNotEmpty) {
    filteredProducts = filteredProducts
        .where(
          (p) =>
              p.name.toLowerCase().contains(query.toLowerCase()) ||
              p.barcode.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  return filteredProducts;
}
