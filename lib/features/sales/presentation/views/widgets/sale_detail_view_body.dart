import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/core/utils/widgets/custom_error_state_widget.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_detail_cubit/sale_detail_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_header_card.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_skeleton.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_totals_section.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_purchased_item_list.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleDetailViewBody extends StatelessWidget {
  const SaleDetailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaleDetailCubit, SaleDetailState>(
      builder: (context, state) {
        if (state is SaleDetailLoadingState) {
          return const SaleDetailSkeleton();
        }
        if (state is SaleDetailErrorState) {
          return CustomErrorStateWidget(
            errMessage: state.errMessage,
            onPressed: () {},
          );
        }
        if (state is SaleDetailSuccessState) {
          final sale = state.sale;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SaleDetailHeaderCard(sale: sale),
                const SizedBox(height: 32),
                Text(
                  S.of(context).purchasedItems,
                  style: AppStyles.labelSemiBold13(
                    context,
                  ).copyWith(color: AppColorsDarkMode.textSecondary),
                ),
                const SizedBox(height: 20),
                SalePurchasedItemList(items: sale.items),
                const SizedBox(height: 20),
                SaleDetailTotalsSection(
                  totalAmount: sale.totalAmount,
                ), // sale.totalAmount
                const SizedBox(height: 20),
                BlocBuilder<SaleDetailCubit, SaleDetailState>(
                  builder: (context, state) {
                    final bool isGenerating =
                        state is SaleDetailPdfGeneratingState;
                    final bool isPdfReady = state is SaleDetailPdfReadyState;
                    return CustomButton(
                      onPressed: () =>
                          context.read<SaleDetailCubit>().exportPdf(),
                      isLoading: isGenerating,
                      buttonName: S.of(context).exportPdf,
                      iconButton: isPdfReady
                          ? Icons.check_circle_outline
                          : Icons.picture_as_pdf_outlined,
                      changeColors: true,
                    );
                  },
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
