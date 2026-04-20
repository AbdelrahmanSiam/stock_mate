import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';

class InvoiceItemModel extends InvoiceItemEntity {
  InvoiceItemModel({
    required super.productId,
    required super.productName,
    required super.productImageUrl,
    required super.unitPrice,
    required super.quantity,
    required super.availableStock,
  });

  factory InvoiceItemModel.fromFirebase(Map<String, dynamic> json) {
    return InvoiceItemModel(
      productId: json[kProductId] ?? '',
      productName: json[kProductName] ?? '',
      productImageUrl: json[kProductImageUrl] ?? '',
      unitPrice: (json[kUnitPrice] as num).toDouble(),
      quantity: (json[kQuantity] as num).toInt(),
      availableStock: 0, // Not important at history
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      kProductId: productId,
      kProductName: productName,
      kProductImageUrl: productImageUrl,
      kUnitPrice: unitPrice,
      kQuantity: quantity,
      kTotalPrice: totalPrice,
    };
  }
}
