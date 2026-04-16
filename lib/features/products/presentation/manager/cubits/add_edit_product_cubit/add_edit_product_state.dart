part of 'add_edit_product_cubit.dart';

@immutable
sealed class AddEditProductState {}

final class AddEditProductInitialState extends AddEditProductState {}

final class AddEditProductLoadingState extends AddEditProductState {}

final class AddEditProductSuccessState extends AddEditProductState {}

final class AddEditProductErrorState extends AddEditProductState {
  final String errMessage;
  AddEditProductErrorState(this.errMessage);
}
