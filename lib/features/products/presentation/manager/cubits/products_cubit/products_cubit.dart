import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/domain/use_cases/get_products_use_case/get_products_use_case.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit_helper.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUseCase getProductsUseCase;
  StreamSubscription? streamSubscription;
  ProductsCubit(this.getProductsUseCase) : super(ProductsInitialState());

  void allProducts({String? initialFilter}) {
    emit(ProductsLoadingState());
    streamSubscription = getProductsUseCase.call().listen(
      (result) {
        result.fold(
          (failure) {
            emit(ProductsFailureState(errMessage: failure.errMessage));
          },
          (products) {
            final filter = initialFilter == "lowStock"
                ? ProductFilter.lowStock
                : ProductFilter.all;
            emit(
              ProductsSuccessState(
                allProducts: products,
                filteredProducts: applyFilters(
                  products: products,
                  filter: filter,
                  query: "",
                ),
                activeFilter: filter,
                searchQuery: "",
              ),
            );
          },
        );
      },
      onError: (error) {
        emit(ProductsFailureState(errMessage: error.toString()));
      },
    );
  }

  void search(String query) {
    if (state is! ProductsSuccessState) return;
    final availableState = state as ProductsSuccessState;
    emit(
      ProductsSuccessState(
        allProducts: availableState.allProducts,
        filteredProducts: applyFilters(
          products: availableState.allProducts,
          filter: availableState.activeFilter,
          query: query,
        ),
        activeFilter: availableState.activeFilter,
        searchQuery: query,
      ),
    );
  }

  void setFilter(ProductFilter filter) {
    if (state is ProductsSuccessState) return;
    final currentState = state as ProductsSuccessState;
    emit(
      ProductsSuccessState(
        allProducts: currentState.allProducts,
        filteredProducts: applyFilters(
          products: currentState.allProducts,
          filter: filter,
          query: currentState.searchQuery,
        ),
        activeFilter: filter,
        searchQuery: currentState.searchQuery,
      ),
    );
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
