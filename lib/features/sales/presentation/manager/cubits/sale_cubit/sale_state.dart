part of 'sale_cubit.dart';

@immutable
sealed class SaleState {}

final class SaleInitialState extends SaleState {}

final class SaleConfirmingState extends SaleState {}

final class SaleItemsUploadedState extends SaleState {
  final Map<String, InvoiceItemEntity> invoiceItems;
  final List<ProductEntity> searchResults;
  final String searchQuery;
  final String paymentMethod;

  SaleItemsUploadedState({
    required this.invoiceItems,
    required this.searchResults,
    required this.searchQuery,
    required this.paymentMethod,
  });

  double get subTotal =>
      invoiceItems.values.fold(0, (sum, item) => sum + item.totalPrice);
  int get totalItemsCount =>
      invoiceItems.values.fold(0, (sum, item) => sum + item.quantity);
  List<InvoiceItemEntity> get itemsList => invoiceItems.values.toList();
  bool get isEmpty => invoiceItems.isEmpty;
}

final class SaleSuccessState extends SaleState {
  final SaleEntity sale;

  SaleSuccessState({required this.sale});
}

final class SaleErrorState extends SaleState {
  final String errMessage;

  SaleErrorState({required this.errMessage});
}
