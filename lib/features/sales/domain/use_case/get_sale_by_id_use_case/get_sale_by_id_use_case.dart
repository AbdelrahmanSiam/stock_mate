import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/repo/sale_repository.dart';
import 'package:stock_mate/features/sales/domain/use_case/get_sale_by_id_use_case/get_sale_by_id_use_case_parameters.dart';

class GetSaleByIdUseCase
    implements UseCase<SaleEntity, GetSaleByIdUseCaseParameters> {
  final SaleRepository repository;
  const GetSaleByIdUseCase(this.repository);

  @override
  Future<Either<Failure, SaleEntity>> call([
    GetSaleByIdUseCaseParameters? param,
  ]) {
    return repository.getSaleById(saleId: param!.saleId);
  }
}
