import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColorsDarkMode.primary),
        ),
        title: BlocBuilder<SaleDetailCubit, SaleDetailState>(
          builder: (context, state) {
            if (state is SaleDetailSuccessState) {
              return Text(
                state.sale.invoiceNumber,
                style: AppStyles.sectionTitleSemiBold16(context),
              );
            }
            return Text(
              S.of(context).saleDetail,
              style: AppStyles.sectionTitleSemiBold16(context),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: AppColorsDarkMode.textSecondary,
            ),
            onPressed: () {
              //  Share invoice
            },
          ),
        ],
      ),
      body: SaleDetailViewBody(),
    );
  }
}
