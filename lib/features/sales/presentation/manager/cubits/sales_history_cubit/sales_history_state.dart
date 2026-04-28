part of 'sales_history_cubit.dart';

@immutable
sealed class SalesHistoryState {}

final class SalesHistoryInitialState extends SalesHistoryState {}

final class SalesHistoryLoadingState extends SalesHistoryState {}

final class SalesHistorySuccessState extends SalesHistoryState {
  final List<SaleEntity> sales;
  final SaleFilter activeFilter;

  SalesHistorySuccessState({required this.sales, required this.activeFilter});
  int get transactionVolume => sales.length;
  double get grossRevenue => sales.fold(0, (sum, s) => sum + s.totalAmount);
}

final class SalesHistoryFailureState extends SalesHistoryState {
  final String errMessage;

  SalesHistoryFailureState({required this.errMessage});
}
