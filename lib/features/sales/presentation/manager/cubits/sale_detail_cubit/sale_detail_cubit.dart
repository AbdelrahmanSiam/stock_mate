import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/use_case/get_sale_by_id_use_case/get_sale_by_id_use_case.dart';
import 'package:stock_mate/features/sales/domain/use_case/get_sale_by_id_use_case/get_sale_by_id_use_case_parameters.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/utils/sale_pdf_generator.dart';

part 'sale_detail_state.dart';

class SaleDetailCubit extends Cubit<SaleDetailState> {
  final GetSaleByIdUseCase getSaleByIdUseCase;
  SaleDetailCubit(this.getSaleByIdUseCase) : super(SaleDetailInitialState());

  // ── getSale ────────────────────────────────────────────────
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

  // ── exportPdf ───────────────────────────────────────────────
  Future<void> exportPdf() async {
    final SaleEntity? sale = _getCurrentSale();
    if (sale == null) return;
    emit(SaleDetailPdfGeneratingState(sale));

    try {
      final file = await SalePdfGenerator.generate(sale);
      emit(SaleDetailPdfReadyState(sale: sale, filePath: file.path));
    } catch (e) {
      emit(
        SaleDetailPdfErrorState(
          sale: sale,
          errMessage: 'Failed to generate PDF: ${e.toString()}',
        ),
      );
    }
  }

  // ── _getCurrentSale ─────────────────────────────────────────
  SaleEntity? _getCurrentSale() {
    return switch (state) {
      SaleDetailSuccessState() => (state as SaleDetailSuccessState).sale,
      SaleDetailPdfGeneratingState() =>
        (state as SaleDetailPdfGeneratingState).sale,
      SaleDetailPdfReadyState() => (state as SaleDetailPdfReadyState).sale,
      SaleDetailPdfErrorState() => (state as SaleDetailPdfErrorState).sale,
      _ => null,
    };
  }
}
