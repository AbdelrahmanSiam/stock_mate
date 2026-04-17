import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/domain/use_cases/add_product_use_case/add_product_use_case.dart';
import 'package:stock_mate/features/products/domain/use_cases/add_product_use_case/add_products_use_case_parameters.dart';
import 'package:stock_mate/features/products/domain/use_cases/delete_product_image_use_case/delete_product_image_use_case_parameters.dart';
import 'package:stock_mate/features/products/domain/use_cases/delete_product_image_use_case/delete_product_image_usecase.dart';
import 'package:stock_mate/features/products/domain/use_cases/update_product_use_case/update_product_use_case_parameters.dart';
import 'package:stock_mate/features/products/domain/use_cases/update_product_use_case/update_product_usecase.dart';
import 'package:stock_mate/features/products/domain/use_cases/upload_product_image_use_case/upload_product_image_use_case.dart';
import 'package:stock_mate/features/products/domain/use_cases/upload_product_image_use_case/upload_product_image_use_case_parameters.dart';
import 'package:uuid/uuid.dart';

part 'add_edit_product_state.dart';

class AddEditProductCubit extends Cubit<AddEditProductState> {
  final AddProductUseCase addProductUseCase;
  final UpdateProductUseCase updateProductUseCase;
  final UploadProductImageUseCase uploadProductImageUseCase;
  final DeleteProductImageUseCase deleteProductImageUseCase;
  AddEditProductCubit(
    this.addProductUseCase,
    this.uploadProductImageUseCase,
    this.updateProductUseCase,
    this.deleteProductImageUseCase,
  ) : super(AddEditProductInitialState());

  Future<void> uploadImage(File image) async {
    emit(AddEditProductImageUploadingState());
    final result = await uploadProductImageUseCase.call(
      UploadProductImageUseCaseParameters(image: image),
    );
    result.fold(
      (failure) => emit(AddEditProductErrorState(failure.errMessage)),
      (url) => emit(AddEditProductImageUploadedState(url)),
    );
  }

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
    String? oldImageUrl,
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
    final bool isEdit =
        existingId != null; // isEdit is true when there are existing Id already
    final result = isEdit
        ? await updateProductUseCase.call(
            UpdateProductUseCaseParameters(product: product),
          )
        : await addProductUseCase.call(
            AddProductsUseCaseParameters(product: product),
          );
    result.fold(
      (error) {
        emit(AddEditProductErrorState(error.errMessage));
      },
      (_) {
        if (isEdit &&
            oldImageUrl != null &&
            oldImageUrl.isNotEmpty &&
            oldImageUrl != imageUrl) {
          deleteProductImageUseCase.call(
            DeleteProductImageUseCaseParameters(imageUrl: oldImageUrl),
          );
        }
        emit(AddEditProductSavedState());
      },
    );
  }
}
