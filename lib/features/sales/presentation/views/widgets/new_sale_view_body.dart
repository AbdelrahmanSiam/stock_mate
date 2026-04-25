import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';
import 'invoice_item_row.dart';
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
          return const Center(
            child: CircularProgressIndicator(
              color: AppColorsDarkMode.primary,
            ),
          );
        }

        if (state is SaleErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,
                    color: AppColorsDarkMode.error, size: 48),
                const SizedBox(height: 12),
                Text(state.errMessage),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<SaleCubit>().init(),
                  child: Text(S.of(context).retry),
                ),
              ],
            ),
          );
        }

        if (state is! SaleItemsUpdatedState) return const SizedBox();

        return Column(
          children: [
            // ── Search + Dropdown ──────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // ✅ مهم
                children: [
                  SaleSearchBar(
                    onChanged: (q) =>
                        context.read<SaleCubit>().search(q),
                    onBarcodeScanned: (barcode) =>
                        context.read<SaleCubit>().search(barcode),
                  ),
                  // ✅ Dropdown بيظهر فوق الـ list مش بيدفعها
                  if (state.searchResults.isNotEmpty)
                    SearchResultsDropdown(
                      results: state.searchResults,
                      onProductSelected: (product) =>
                          context.read<SaleCubit>().addProduct(product),
                    ),
                ],
              ),
            ),

            // ── SELECTED ITEMS label ───────────────────
            if (state.itemsList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).selectedItems,
                    style: TextStyle(
                      fontSize:      11,
                      fontWeight:    FontWeight.w600,
                      color:         AppColorsDarkMode.textSecondary,
                      letterSpacing: 1.2,
                      fontFamily:    'Inter',
                    ),
                  ),
                ),
              ),

            // ── Invoice Items — Expanded عشان ياخد الباقي ─
            Expanded(
              child: state.itemsList.isEmpty
                  ? const NewSaleEmptyState()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      itemCount:       state.itemsList.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 10),
                      itemBuilder: (_, index) {
                        final item = state.itemsList[index];
                        return InvoiceItemRow(
                          item:        item,
                          onIncrement: () => context
                              .read<SaleCubit>()
                              .incrementItem(item.productId),
                          onDecrement: () => context
                              .read<SaleCubit>()
                              .decrementItem(item.productId),
                          onRemove: () => context
                              .read<SaleCubit>()
                              .removeItem(item.productId),
                        );
                      },
                    ),
            ),

            // ── Summary sticky bottom ──────────────────
            SaleSummaryWidget(
              state:     state,
              onConfirm: onConfirmTapped,
            ),
          ],
        );
      },
    );
  }
}