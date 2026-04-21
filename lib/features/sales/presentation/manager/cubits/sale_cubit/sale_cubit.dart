import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';

part 'sale_state.dart';

class SaleCubit extends Cubit<SaleState> {
  SaleCubit() : super(SaleInitialState());
}
