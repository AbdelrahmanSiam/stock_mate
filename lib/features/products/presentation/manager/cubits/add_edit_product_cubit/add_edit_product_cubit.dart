import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_edit_product_state.dart';

class AddEditProductCubit extends Cubit<AddEditProductState> {
  AddEditProductCubit() : super(AddEditProductInitialState());
}
