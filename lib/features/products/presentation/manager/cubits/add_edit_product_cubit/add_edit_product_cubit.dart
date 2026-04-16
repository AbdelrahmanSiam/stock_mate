import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/domain/use_cases/add_product_use_case.dart';
import 'package:stock_mate/features/products/domain/use_cases/add_products_use_case_parameters.dart';
import 'package:uuid/uuid.dart';

part 'add_edit_product_state.dart';

class AddEditProductCubit extends Cubit<AddEditProductState> {
  final AddProductUseCase addProductUseCase;
  AddEditProductCubit(this.addProductUseCase)
    : super(AddEditProductInitialState());

  Future<void> saveProduct({
    required String? existingId,
    required String name,
    required String barcode,
    required String category,
    required double buyPrice,
    required double sellPrice,
    required int quantity,
    required int threshold,
    required String imageUrl,
  }) async {
    emit(AddEditProductSavingState());
    final String productId = existingId ?? const Uuid().v4();
    final product = ProductEntity(
      id: productId,
      name: name,
      barcode: barcode,
      category: category,
      buyPrice: buyPrice,
      sellPrice: sellPrice,
      quantity: quantity,
      threshold: threshold,
      imageUrl: imageUrl,
    );
    final result = await addProductUseCase.call(
      AddProductsUseCaseParameters(product: product),
    );
    result.fold(
      (error) {
        emit(AddEditProductErrorState(error.errMessage));
      },
      (_) {
        emit(AddEditProductSavedState());
      },
    );
  }
}
