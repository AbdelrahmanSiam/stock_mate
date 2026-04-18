import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_filter_chips.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_skeleton_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/products_error_state.dart';
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
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts(
      initialFilter: widget.initialFilter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: ProductsViewHeader()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: ProductsSearchBar(
                    onChanged: (value) {
                      context.read<ProductsCubit>().search(value);
                    },
                    onBarcodeScanned: (value) {
                      context.read<ProductsCubit>().search(value);
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                if (state is ProductsSuccessState)
                  SliverToBoxAdapter(
                    child: ProductFilterChips(
                      activeFilter: state.activeFilter,
                      onFilterChanged: (f) {
                        context.read<ProductsCubit>().setFilter(f);
                      },
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                if (state is ProductsLoadingState)
                  const SliverToBoxAdapter(child: ProductSkeletonWidget())
                else if (state is ProductsFailureState)
                  SliverToBoxAdapter(
                    child: ProductsErrorState(message: state.errMessage),
                  )
                else if (state is ProductsSuccessState)
                  ProductsViewContent(
                    state: state,
                    isLoading: state is ProductsLoadingState,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
