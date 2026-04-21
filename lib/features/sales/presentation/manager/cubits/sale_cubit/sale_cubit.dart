import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/invoice_item_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_entity.dart';
import 'package:stock_mate/features/sales/domain/use_case/create_sale_use_case/create_sale_use_case.dart';

part 'sale_state.dart';

class SaleCubit extends Cubit<SaleState> {
  final CreateSaleUseCase createSaleUseCase;
  List<ProductEntity> allProducts = [];
  SaleCubit(this.createSaleUseCase) : super(SaleInitialState());

  void init(List<ProductEntity> products) {
    allProducts = products;
    emit(
      SaleItemsUploadedState(
        invoiceItems: {},
        searchResults: [],
        searchQuery: "",
        paymentMethod: "Cash",
      ),
    );
  }
}
