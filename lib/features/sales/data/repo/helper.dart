import 'package:stock_mate/features/sales/data/models/invoice_item_model.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';

InvoiceItemModel itemEntityToItemModel(InvoiceItemEntity entity) =>
    InvoiceItemModel(
      productId: entity.productId,
      productName: entity.productName,
      productImageUrl: entity.productImageUrl,
      unitPrice: entity.unitPrice,
      quantity: entity.quantity,
      availableStock: entity.availableStock,
    );
