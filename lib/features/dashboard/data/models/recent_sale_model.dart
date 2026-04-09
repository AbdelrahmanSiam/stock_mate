import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/dashboard/domain/entites/recent_sale_entity.dart';

class RecentSaleModel extends RecentSaleEntity {
  const RecentSaleModel({
    required super.invoiceNumber,
    required super.paymentMethod,
    required super.totalAmount,
    required super.createdAt,
  });

  factory RecentSaleModel.fromFirestore(Map<String, dynamic> json) {
    return RecentSaleModel(
      invoiceNumber: json[kInvoiceNumber] ?? '',
      paymentMethod: json[kPaymentMethod] ?? 'Cash',
      totalAmount: (json[kTotalAmount] as num).toDouble(),
      createdAt: (json[kCreatedAt] as Timestamp).toDate(),
    );
  }
}
