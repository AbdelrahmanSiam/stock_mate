import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_snack_bar.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_detail_cubit/sale_detail_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_detail_view_body.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleDetailsView extends StatefulWidget {
  final String saleId;
  const SaleDetailsView({super.key, required this.saleId});

  @override
  State<SaleDetailsView> createState() => _SaleDetailsViewState();
}

class _SaleDetailsViewState extends State<SaleDetailsView> {
  @override
  void initState() {
    context.read<SaleDetailCubit>().getSale(widget.saleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaleDetailCubit, SaleDetailState>(
      listener: (context, state) {
        if (state is SaleDetailPdfReadyState) {
          AppSnackBar.show(
            context,
            message: 'PDF saved to ${state.filePath}',
            type: SnackBarType.success,
          );
        }
        if (state is SaleDetailPdfErrorState) {
          AppSnackBar.show(
            context,
            message: state.errMessage,
            type: SnackBarType.error,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: AppColorsDarkMode.primary),
          ),
          title: BlocBuilder<SaleDetailCubit, SaleDetailState>(
            builder: (context, state) {
              final sale = switch (state) {
                SaleDetailSuccessState() =>
                  (state as SaleDetailSuccessState).sale,
                SaleDetailPdfGeneratingState() =>
                  (state as SaleDetailPdfGeneratingState).sale,
                SaleDetailPdfReadyState() =>
                  (state as SaleDetailPdfReadyState).sale,
                SaleDetailPdfErrorState() =>
                  (state as SaleDetailPdfErrorState).sale,
                _ => null,
              };
              return Text(
                sale?.invoiceNumber ?? S.of(context).saleDetail,
                style: AppStyles.sectionTitleSemiBold16(context),
              );
            },
          ),
          actions: [
            BlocBuilder<SaleDetailCubit, SaleDetailState>(
              builder: (context, state) {
                final bool hasData =
                    state is SaleDetailSuccessState ||
                    state is SaleDetailPdfGeneratingState ||
                    state is SaleDetailPdfReadyState ||
                    state is SaleDetailPdfErrorState;

                // Is pdf is being generated, we can show a loading indicator instead of share button
                final bool isGenerating = state is SaleDetailPdfGeneratingState;
                return IconButton(
                  icon: const Icon(
                    Icons.share_outlined,
                    color: AppColorsDarkMode.textSecondary,
                  ),
                  onPressed: hasData && !isGenerating
                      ? () => context.read<SaleDetailCubit>().sharePdf()
                      : null,
                );
              },
            ),
          ],
        ),
        body: SaleDetailViewBody(),
      ),
    );
  }
}
