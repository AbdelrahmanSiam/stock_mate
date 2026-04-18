part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitialState extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsSuccessState extends ProductsState {
  final List<ProductEntity> allProducts;
  final List<ProductEntity> filteredProducts;
  final ProductFilter activeFilter;
  final String searchQuery;

  ProductsSuccessState({
    required this.allProducts,
    required this.filteredProducts,
    required this.activeFilter,
    required this.searchQuery,
  });
}

final class ProductsFailureState extends ProductsState {
  final String errMessage;

  ProductsFailureState({required this.errMessage});
}

enum ProductFilter { all, lowStock, outOfStock }
