part of 'add_edit_product_cubit.dart';

@immutable
sealed class AddEditProductState {}

final class AddEditProductInitialState extends AddEditProductState {}

final class AddEditProductSavingState extends AddEditProductState {}

final class AddEditProductSavedState extends AddEditProductState {}

final class AddEditProductErrorState extends AddEditProductState {
  final String errMessage;
  AddEditProductErrorState(this.errMessage);
}
