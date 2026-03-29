import 'package:dartz/dartz.dart';
import 'package:stock_mate/core/errors/failure.dart';

abstract class UseCase< T , Parameters> {
  Future <Either<Failure , T>> call ([Parameters ? param]);
}
class NoParameters{}