import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/use_case/create_sale_use_case/create_sale_use_case.dart';

part 'sale_state.dart';

class SaleCubit extends Cubit<SaleState> {
  final CreateSaleUseCase createSaleUseCase;
  List<ProductEntity> allProducts = [];
  SaleCubit(this.createSaleUseCase) : super(SaleInitialState());

  void init(List<ProductEntity> products) {
    allProducts = products;
    emit(
      SaleItemsUploadedState(
        invoiceItems: {},
        searchResults: [],
        searchQuery: "",
        paymentMethod: "Cash",
      ),
    );
  }

  void search(String query) {
    if (state is! SaleItemsUploadedState) return;
    final current = state as SaleItemsUploadedState;
    final results = query.isEmpty
        ? <ProductEntity>[]
        : allProducts
              .where(
                (p) =>
                    p.name.toLowerCase().contains(query.toLowerCase()) ||
                    p.barcode.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    emit(
      SaleItemsUploadedState(
        invoiceItems: current.invoiceItems,
        searchResults: results,
        searchQuery: query,
        paymentMethod: current.paymentMethod,
      ),
    );
  }

  // We add this method to add product to sales collection but we check fist it it there so : when i will add product to sales i will get this product.id and check if exist before in sales or not if yes check if canIncrement(quantity > th) increase quantity variable of this item by one , if not check first if this item quantity more than zero and then add this item to items in sales collection
  void addProduct(ProductEntity product) {
    if (state is! SaleItemsUploadedState) return;
    final current = state as SaleItemsUploadedState;
    Map<String, InvoiceItemEntity> updated = Map.from(current.invoiceItems);
    final existing =
        updated[product
            .id]!; // to know if product will added is existing or not
    if (existing.canIncrement) {
      updated[product.id] = existing.copyWith(quantity: existing.quantity + 1);
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
      SaleItemsUploadedState(
        invoiceItems: updated,
        searchResults: [],
        searchQuery: '',
        paymentMethod: current.paymentMethod,
      ),
    );
  }

  void incrementItem(String productId) {
    if (state is! SaleItemsUploadedState) return;
    final current = state as SaleItemsUploadedState;
    final item = current.invoiceItems[productId];
    if (item == null || !item.canIncrement) return;
    final updated = Map<String, InvoiceItemEntity>.from(current.invoiceItems);
    updated[productId] = item.copyWith(quantity: item.quantity + 1);
    emit(
      SaleItemsUploadedState(
        invoiceItems: updated,
        searchResults: current.searchResults,
        searchQuery: current.searchQuery,
        paymentMethod: current.paymentMethod,
      ),
    );
  }
}
