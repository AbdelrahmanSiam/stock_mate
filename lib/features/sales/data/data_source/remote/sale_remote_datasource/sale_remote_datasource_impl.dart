import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/sales/data/data_source/remote/sale_remote_datasource/sale_remote_datasource.dart';
import 'package:stock_mate/features/sales/data/data_source/remote/sale_remote_datasource/sales_remote_datasource_helper.dart';
import 'package:stock_mate/features/sales/data/models/invoice_item_model.dart';
import 'package:stock_mate/features/sales/data/models/sale_model.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_filter.dart';
import 'package:uuid/uuid.dart';

class SaleRemoteDatasourceImpl implements SaleRemoteDataSource {
  final FirebaseFirestore firestore;

  SaleRemoteDatasourceImpl(this.firestore);
  @override
  Future<SaleModel> createSale({
    required List<InvoiceItemModel> items,
    required String paymentMethod,
  }) async {
    final String saleId = const Uuid().v4();
    final String invoiceNumber = generateInvoiceNumber();
    final double total = items.fold(
      0,
      (allSum, item) => allSum + item.totalPrice,
    );
    final SaleModel sale = SaleModel(
      id: saleId,
      invoiceNumber: invoiceNumber,
      paymentMethod: paymentMethod,
      totalAmount: total,
      itemsCount: items.fold(0, (allSum, i) => allSum + i.quantity),
      items: items,
      createdAt: DateTime.now(),
    );
    final WriteBatch batch = firestore
        .batch(); // to make more than write to firestore at the same time , ALl success or all fail
    batch.set(
      firestore.collection(kSalesCollection).doc(saleId),
      sale.toFireStore(),
    );
    for (var item in items) {
      batch.update(
        firestore.collection(kProductsCollection).doc(item.productId),
        {kQuantity: FieldValue.increment(-item.quantity)},
      ); // update only quantity field on each product
    }
    await batch.commit();
    return sale;
  }

  @override
  Stream<List<SaleModel>> getRecentSales({required SaleFilter filter}) {
    return firestore
        .collection(kSalesCollection)
        .where(
          kCreatedAt,
          isGreaterThanOrEqualTo: Timestamp.fromDate(filter.startDate),
        )
        .orderBy(kCreatedAt, descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => SaleModel.fromFirestore(doc.data(), doc.id))
              .toList(),
        );
  }

  @override
  Future<SaleEntity> getSaleById({required String saleId}) async {
    final doc = await firestore.collection(kSalesCollection).doc(saleId).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('Sale not found');
    }
    return SaleModel.formFirebase(doc.data()!, saleId: doc.id);
  }
}
