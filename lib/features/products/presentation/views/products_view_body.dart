import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/utils/widgets/custom_error_state_widget.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_filter_chips.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_skeleton_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_search_bar.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_view_content.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key, this.initialFilter});
  final String? initialFilter;
  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ProductsViewHeader(),
                      const SizedBox(height: 20),
                      ProductsSearchBar(
                        onChanged: (searchQuery) =>
                            context.read<ProductsCubit>().search(searchQuery),
                        onBarcodeScanned: (barcodeQuery) =>
                            context.read<ProductsCubit>().search(barcodeQuery),
                      ),
                      const SizedBox(height: 20),
                      if (state is ProductsSuccessState)
                        ProductFilterChips(
                          activeFilter: state.activeFilter,
                          onFilterChanged: (f) =>
                              context.read<ProductsCubit>().setFilter(f),
                        ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                if (state is ProductsLoadingState)
                  const SliverToBoxAdapter(child: ProductSkeletonWidget())
                else if (state is ProductsFailureState)
                  SliverToBoxAdapter(
                    child: CustomErrorStateWidget(
                      errMessage: state.errMessage,
                      onPressed: () =>
                          context.read<ProductsCubit>().getProducts(),
                    ),
                  )
                else if (state is ProductsSuccessState)
                  ProductsViewContent(state: state),
              ],
            ),
          );
        },
      ),
    );
  }
}
