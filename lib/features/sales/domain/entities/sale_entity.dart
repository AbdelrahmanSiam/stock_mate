import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';

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
  // Skeleton loading
  factory SaleEntity.empty() => SaleEntity(
    id: 'id',
    invoiceNumber: 'INV-20240410-1042',
    paymentMethod: 'Cash',
    totalAmount: 450.00,
    itemsCount: 3,
    items: [],
    createdAt: DateTime.now(),
  );
}
