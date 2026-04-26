class InvoiceItemEntity {
  final String productId;
  final String productName;
  final String productImageUrl;
  final double unitPrice;
  final int quantity;
  final int
  availableStock; // validation to know current amount when user increase

  const InvoiceItemEntity({
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    required this.unitPrice,
    required this.quantity,
    required this.availableStock,
  });

  double get totalPrice => unitPrice * quantity;

  // copyWith for quantity updates
  InvoiceItemEntity copyWith({int? quantity}) => InvoiceItemEntity(
    productId: productId,
    productName: productName,
    productImageUrl: productImageUrl,
    unitPrice: unitPrice,
    quantity: quantity ?? this.quantity,
    availableStock: availableStock,
  );

  bool get canIncrement => quantity < availableStock;
  
  factory InvoiceItemEntity.empty() => const InvoiceItemEntity(
    productId: 'id',
    productName: 'Product Name Here',
    productImageUrl: '',
    unitPrice: 199.00,
    quantity: 2,
    availableStock: 10,
  );
}
