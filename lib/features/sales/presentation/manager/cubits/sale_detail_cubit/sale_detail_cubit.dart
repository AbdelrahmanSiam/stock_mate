import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';

part 'sale_detail_state.dart';

class SaleDetailCubit extends Cubit<SaleDetailState> {
  SaleDetailCubit() : super(SaleDetailInitialState());
}
