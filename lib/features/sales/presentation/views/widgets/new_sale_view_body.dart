import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/new_sale_error_widget.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/new_sale_initial_body.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/new_sale_invoice_items.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/selected_items_text.dart';
import 'new_sale_empty_state.dart';
import 'sale_search_bar.dart';
import 'sale_summary_widget.dart';
import 'search_results_dropdown.dart';

class NewSaleViewBody extends StatelessWidget {
  final VoidCallback onConfirmTapped;
  const NewSaleViewBody({super.key, required this.onConfirmTapped});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaleCubit, SaleState>(
      builder: (context, state) {
        if (state is SaleInitialState) {
          return NewSaleInitialBody();
        }
        if (state is SaleErrorState) {
          return NewSaleErrorWidget(errMessage: state.errMessage);
        }
        if (state is! SaleItemsUpdatedState) return const SizedBox();
        return SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: SaleSearchBar(
                      onChanged: (q) => context.read<SaleCubit>().search(q),
                      onBarcodeScanned: (barcode) =>
                          context.read<SaleCubit>().search(barcode),
                    ),
                  ),

                  if (state.itemsList.isNotEmpty) const SelectedItemsText(),

                  Expanded(
                    child: state.itemsList.isEmpty
                        ? const NewSaleEmptyState()
                        : NewSaleInvoiceItems(itemsList: state.itemsList),
                  ),

                  SaleSummaryWidget(state: state, onConfirm: onConfirmTapped),
                ],
              ),

              if (state.searchResults.isNotEmpty)
                Positioned(
                  top: 72,
                  left: 16,
                  right: 16,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(16),
                    child: ConstrainedBox(
                      constraints:  BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height*0.3),
                      child: SearchResultsDropdown(
                        results: state.searchResults,
                        onProductSelected: (product) {
                          context.read<SaleCubit>().addProduct(product);
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
