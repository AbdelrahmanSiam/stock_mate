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

//                                 PDF states

final class SaleDetailPdfGeneratingState extends SaleDetailState {
  final SaleEntity
  sale; // Need sale because UI will not change and we can show a loading indicator on top of the current details
  SaleDetailPdfGeneratingState(this.sale);
}

final class SaleDetailPdfReadyState extends SaleDetailState {
  final SaleEntity sale;
  final String filePath;
  SaleDetailPdfReadyState({required this.sale, required this.filePath});
}

final class SaleDetailPdfErrorState extends SaleDetailState {
  final SaleEntity
  sale; // Need sale for retrying PDF generation without refetching sale details
  final String errMessage;
  SaleDetailPdfErrorState({required this.sale, required this.errMessage});
}
