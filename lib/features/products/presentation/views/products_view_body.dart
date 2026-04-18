import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_filter_chips.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_skeleton_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_error_state.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_search_bar.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_view_content.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return Column(
              children: [
                ProductsViewHeader(),
                const SizedBox(height: 20),
                ProductsSearchBar(
                  onChanged: (String nameQuery) {
                    (context).read<ProductsCubit>().search(nameQuery);
                  },
                  onBarcodeScanned: (String barcodeQuery) {
                    (context).read<ProductsCubit>().search(barcodeQuery);
                  },
                ),
                const SizedBox(height: 20),
                if (state is ProductsSuccessState) ...[
                  ProductFilterChips(
                    activeFilter: state.activeFilter,
                    onFilterChanged: (f) =>
                        context.read<ProductsCubit>().setFilter(f),
                  ),
                  const SizedBox(height: 20),
                ],
                if (state is ProductsLoadingState)
                  const ProductSkeletonWidget()
                else if (state is ProductsFailureState)
                  ProductsErrorState(message: state.errMessage)
                else if (state is ProductsSuccessState)
                  ProductsViewContent(state: state),
              ],
            );
          },
        ),
      ),
    );
  }
}
