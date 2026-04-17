import 'package:stock_mate/features/products/domain/entities/product_entity.dart';

class UpdateProductUseCaseParameters {
  final ProductEntity product;
  const UpdateProductUseCaseParameters({required this.product});
}
