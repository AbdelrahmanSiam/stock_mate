import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';

class CreateSaleUseCaseParameters {
  final List<InvoiceItemEntity> items;
  final String paymentMethod;

  const CreateSaleUseCaseParameters({
    required this.items,
    required this.paymentMethod,
  });
}
