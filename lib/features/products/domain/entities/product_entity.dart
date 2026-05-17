class ProductEntity {
  final String id;
  final String name;
  final String barcode;
  final String category;
  final double buyPrice;
  final double sellPrice;
  final int quantity;
  final int threshold;
  final String imageUrl;
  final String userId;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.barcode,
    required this.category,
    required this.buyPrice,
    required this.sellPrice,
    required this.quantity,
    required this.threshold,
    required this.imageUrl,
    required this.userId,
  });

  // SOLID — S
  bool get isLowStock => quantity > 0 && quantity <= threshold;
  bool get isOutOfStock => quantity == 0;
  bool get isInStock => quantity > threshold;

  //skeleton loading — fake data
  factory ProductEntity.empty() => const ProductEntity(
    id: 'id',
    name: 'Product Name Here',
    barcode: 'BAR-000000-X',
    category: 'Category',
    buyPrice: 0,
    sellPrice: 199,
    quantity: 10,
    threshold: 5,
    imageUrl: '',
    userId: '',
  );
  // copyWith method for immutability
  ProductEntity copyWith({
    String? id,
    String? name,
    String? barcode,
    String? category,
    double? buyPrice,
    double? sellPrice,
    int? quantity,
    int? threshold,
    String? imageUrl,
    String? userId,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      barcode: barcode ?? this.barcode,
      category: category ?? this.category,
      buyPrice: buyPrice ?? this.buyPrice,
      sellPrice: sellPrice ?? this.sellPrice,
      quantity: quantity ?? this.quantity,
      threshold: threshold ?? this.threshold,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
    );
  }
}
