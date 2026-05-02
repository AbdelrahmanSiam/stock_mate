import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/use_case/get_sale_by_id_use_case/get_sale_by_id_use_case.dart';
import 'package:stock_mate/features/sales/domain/use_case/get_sale_by_id_use_case/get_sale_by_id_use_case_parameters.dart';

part 'sale_detail_state.dart';

class SaleDetailCubit extends Cubit<SaleDetailState> {
  final GetSaleByIdUseCase getSaleByIdUseCase;
  SaleDetailCubit(this.getSaleByIdUseCase) : super(SaleDetailInitialState());

  Future<void> getSale(String saleId) async {
    emit(SaleDetailLoadingState());
    final result = await getSaleByIdUseCase.call(
      GetSaleByIdUseCaseParameters(saleId: saleId),
    );
    result.fold(
      (failure) => emit(SaleDetailErrorState(errMessage: failure.errMessage)),
      (sale) => emit(SaleDetailSuccessState(sale: sale)),
    );
  }
}
