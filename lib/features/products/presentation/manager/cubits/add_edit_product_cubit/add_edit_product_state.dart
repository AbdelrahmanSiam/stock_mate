part of 'add_edit_product_cubit.dart';

@immutable
sealed class AddEditProductState {}

final class AddEditProductInitialState extends AddEditProductState {}

final class AddEditProductImageUploadingState extends AddEditProductState {}

final class AddEditProductImageUploadedState extends AddEditProductState {
  final String imageUrl;
  AddEditProductImageUploadedState(this.imageUrl);
}

final class AddEditProductDeletingState extends AddEditProductState {}

final class AddEditProductDeletedState extends AddEditProductState {}

final class AddEditProductSavingState extends AddEditProductState {}

final class AddEditProductSavedState extends AddEditProductState {}

final class AddEditProductErrorState extends AddEditProductState {
  final String errMessage;
  AddEditProductErrorState(this.errMessage);
}
