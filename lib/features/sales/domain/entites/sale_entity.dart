import 'package:stock_mate/features/sales/domain/entites/invoice_item_entity.dart';

class SaleEntity {
  final String id;
  final String invoiceNumber;
  final String paymentMethod;
  final double totalAmount;
  final int itemsCount;
  final List<InvoiceItemEntity> items;
  final DateTime createdAt;

  const SaleEntity({
    required this.id,
    required this.invoiceNumber,
    required this.paymentMethod,
    required this.totalAmount,
    required this.itemsCount,
    required this.items,
    required this.createdAt,
  });
}