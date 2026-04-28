import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_filter.dart';
import 'package:stock_mate/features/sales/domain/use_case/get_recent_sales_use_case/get_recent_sales_use_case.dart';

part 'sales_history_state.dart';

class SalesHistoryCubit extends Cubit<SalesHistoryState> {
  final GetRecentSalesUseCase getRecentSalesUseCase;
  StreamSubscription? _subscription;

  SalesHistoryCubit(this.getRecentSalesUseCase)
    : super(SalesHistoryInitialState());

  void getRecentSales({SaleFilter filter = SaleFilter.today}) {
    _subscription?.cancel();
    emit(SalesHistoryLoadingState());
    _subscription = getRecentSalesUseCase.call(filter: filter).listen(
      (result) {
        result.fold(
          (failure) =>
              (emit(SalesHistoryErrorState(errMessage: failure.errMessage))),
          (sales) => emit(
            SalesHistorySuccessState(sales: sales, activeFilter: filter),
          ),
        );
      },
      onError: (error) =>
          emit(SalesHistoryErrorState(errMessage: error.toString())),
    );
  }

  // when change filter
  void changeFilter(SaleFilter filter) {
    getRecentSales(filter: filter);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
