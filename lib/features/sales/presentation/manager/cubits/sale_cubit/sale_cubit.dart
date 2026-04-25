import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/domain/use_cases/get_products_use_case/get_products_use_case.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/use_case/create_sale_use_case/create_sale_use_case.dart';
import 'package:stock_mate/features/sales/domain/use_case/create_sale_use_case/create_sale_use_case_parameters.dart';

part 'sale_state.dart';

class SaleCubit extends Cubit<SaleState> {
  final CreateSaleUseCase createSaleUseCase;
  final GetProductsUseCase getProductsUseCase;
  List<ProductEntity> allProducts = [];
  SaleCubit(this.createSaleUseCase, this.getProductsUseCase)
    : super(SaleInitialState());

  Future<void> init() async {
    emit(SaleInitialState());

    getProductsUseCase().listen((result) {
      result.fold(
        (failure) {
          emit(SaleErrorState(errMessage: failure.errMessage));
        },
        (products) {
          allProducts = products;

          emit(
            SaleItemsUpdatedState(
              invoiceItems: {},
              searchResults: [],
              searchQuery: '',
              paymentMethod: 'Cash',
            ),
          );
        },
      );
    });
  }

  void search(String query) {
    if (state is! SaleItemsUpdatedState) return;
    final current = state as SaleItemsUpdatedState;
    if (query.trim().isEmpty) {
      emit(
        SaleItemsUpdatedState(
          invoiceItems: current.invoiceItems,
          searchResults: [],
          searchQuery: '',
          paymentMethod: current.paymentMethod,
        ),
      );
      return;
    }
    final results = allProducts
        .where(
          (p) =>
              p.name.toLowerCase().contains(query.toLowerCase()) ||
              p.barcode.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    emit(
      SaleItemsUpdatedState(
        invoiceItems: current.invoiceItems,
        searchResults: results,
        searchQuery: query,
        paymentMethod: current.paymentMethod,
      ),
    );
  }

  // We add this method to add product to sales collection but we check fist it it there so : when i will add product to sales i will get this product.id and check if exist before in sales or not if yes check if canIncrement(quantity > th) increase quantity variable of this item by one , if not check first if this item quantity more than zero and then add this item to items in sales collection
  void addProduct(ProductEntity product) {
    if (state is! SaleItemsUpdatedState) return;

    final current = state as SaleItemsUpdatedState;
    final updated = Map<String, InvoiceItemEntity>.from(current.invoiceItems);

    final existing = updated[product.id];

    if (existing != null) {
      if (existing.canIncrement) {
        updated[product.id] = existing.copyWith(
          quantity: existing.quantity + 1,
        );
      }
    } else {
      if (product.quantity > 0) {
        updated[product.id] = InvoiceItemEntity(
          productId: product.id,
          productName: product.name,
          productImageUrl: product.imageUrl,
          unitPrice: product.sellPrice,
          quantity: 1,
          availableStock: product.quantity,
        );
      }
    }

    emit(
      SaleItemsUpdatedState(
        invoiceItems: updated,
        searchResults: [],
        searchQuery: '',
        paymentMethod: current.paymentMethod,
      ),
    );
  }

  void incrementItem(String productId) {
    if (state is! SaleItemsUpdatedState) return;
    final current = state as SaleItemsUpdatedState;
    final item = current.invoiceItems[productId];
    if (item == null || !item.canIncrement) return;
    final updated = Map<String, InvoiceItemEntity>.from(current.invoiceItems);
    updated[productId] = item.copyWith(quantity: item.quantity + 1);
    emit(
      SaleItemsUpdatedState(
        invoiceItems: updated,
        searchResults: current.searchResults,
        searchQuery: current.searchQuery,
        paymentMethod: current.paymentMethod,
      ),
    );
  }

  void decrementItem(String productId) {
    if (state is! SaleItemsUpdatedState) return;
    final current = state as SaleItemsUpdatedState;
    final item = current.invoiceItems[productId];
    if (item == null) return;
    final updated = Map<String, InvoiceItemEntity>.from(current.invoiceItems);
    if (item.quantity <= 1) {
      updated.remove(productId);
    } else {
      updated[productId] = item.copyWith(quantity: item.quantity - 1);
    }
    emit(
      SaleItemsUpdatedState(
        invoiceItems: updated,
        searchResults: current.searchResults,
        searchQuery: current.searchQuery,
        paymentMethod: current.paymentMethod,
      ),
    );
  }

  void removeItem(String productId) {
    if (state is! SaleItemsUpdatedState) return;
    final current = state as SaleItemsUpdatedState;
    final updated = Map<String, InvoiceItemEntity>.from(current.invoiceItems)
      ..remove(productId);
    emit(
      SaleItemsUpdatedState(
        invoiceItems: updated,
        searchResults: current.searchResults,
        searchQuery: current.searchQuery,
        paymentMethod: current.paymentMethod,
      ),
    );
  }

  void setPaymentMethod(String method) {
    if (state is! SaleItemsUpdatedState) return;
    final current = state as SaleItemsUpdatedState;
    emit(
      SaleItemsUpdatedState(
        invoiceItems: current.invoiceItems,
        searchResults: current.searchResults,
        searchQuery: current.searchQuery,
        paymentMethod: method,
      ),
    );
  }

  Future<void> confirmSale() async {
    if (state is! SaleItemsUpdatedState) return;
    final current = state as SaleItemsUpdatedState;

    if (current.isEmpty) return;
    emit(SaleConfirmingState());
    final result = await createSaleUseCase.call(
      CreateSaleUseCaseParameters(
        items: current.itemsList,
        paymentMethod: current.paymentMethod,
      ),
    );
    result.fold(
      (failure) => emit(SaleErrorState(errMessage: failure.errMessage)),
      (sale) => emit(SaleSuccessState(sale: sale)),
    );
  }
}
