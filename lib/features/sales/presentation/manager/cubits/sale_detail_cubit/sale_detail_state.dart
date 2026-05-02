part of 'sale_detail_cubit.dart';

@immutable
sealed class SaleDetailState {}

final class SaleDetailInitialState extends SaleDetailState {}

final class SaleDetailLoadingState extends SaleDetailState {}

final class SaleDetailSuccessState extends SaleDetailState {
  final SaleEntity sale;

  SaleDetailSuccessState({required this.sale});
}

final class SaleDetailErrorState extends SaleDetailState {
  final String errMessage;

  SaleDetailErrorState({required this.errMessage});
}
