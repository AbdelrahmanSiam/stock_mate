import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';
import 'package:stock_mate/core/usecases/use_case.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/repo/sale_repository.dart';
import 'package:stock_mate/features/sales/domain/use_case/create_sale_use_case/create_sale_use_case_parameters.dart';

class CreateSaleUseCase
    implements UseCase<SaleEntity, CreateSaleUseCaseParameters> {
  final SaleRepository repository;

  const CreateSaleUseCase({required this.repository});
  @override
  Future<Either<Failure, SaleEntity>> call([
    CreateSaleUseCaseParameters? param,
  ]) {
    return repository.createSale(
      items: param!.items,
      paymentMethod: param.paymentMethod,
    );
  }
}
