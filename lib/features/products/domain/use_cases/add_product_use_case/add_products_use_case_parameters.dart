import 'package:stock_mate/features/products/domain/entities/product_entity.dart';

class AddProductsUseCaseParameters {
  final ProductEntity product;

  const AddProductsUseCaseParameters({required this.product});
}
