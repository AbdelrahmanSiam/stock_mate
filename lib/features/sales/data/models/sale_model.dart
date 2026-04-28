import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/sales/data/models/invoice_item_model.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';

class SaleModel extends SaleEntity {
  SaleModel({
    required super.id,
    required super.invoiceNumber,
    required super.paymentMethod,
    required super.totalAmount,
    required super.itemsCount,
    required super.items,
    required super.createdAt,
  });

  factory SaleModel.formFirebase(
    Map<String, dynamic> json, {
    required String saleId,
  }) {
    return SaleModel(
      id: saleId,
      invoiceNumber: json[kInvoiceNumber] ?? '',
      paymentMethod: json[kPaymentMethod] ?? '',
      totalAmount: (json[kTotalAmount] as num).toDouble(),
      itemsCount: (json[kItemsCount] as num).toInt(),
      items: (json[kItems] as List)
          .map((item) => InvoiceItemModel.fromFirebase(item))
          .toList(),
      createdAt: (json[kCreatedAt] as Timestamp).toDate(),
    );
  }
  factory SaleModel.fromFirestore(Map<String, dynamic> json, String id) =>
      SaleModel(
        id: id,
        invoiceNumber: json[kInvoiceNumber] ?? '',
        paymentMethod: json[kPaymentMethod] ?? '',
        totalAmount: (json[kTotalAmount] as num).toDouble(),
        itemsCount: (json[kItemsCount] as num).toInt(),
        createdAt: (json[kCreatedAt] as Timestamp).toDate(),
        items: [],
      );

  Map<String, dynamic> toFireStore() {
    return {
      kInvoiceNumber: invoiceNumber,
      kPaymentMethod: paymentMethod,
      kTotalAmount: totalAmount,
      kItemsCount: itemsCount,
      kItems: items
          .map((item) => (item as InvoiceItemModel).toFirestore())
          .toList(),
      kCreatedAt: FieldValue.serverTimestamp(),
    };
  }
}
