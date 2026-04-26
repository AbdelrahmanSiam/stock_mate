import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_snack_bar.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/confirm_dialog.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/discard_dialog.dart';
import 'package:stock_mate/generated/l10n.dart';
import 'widgets/new_sale_view_body.dart';

class NewSaleView extends StatefulWidget {
  const NewSaleView({super.key});

  @override
  State<NewSaleView> createState() => _NewSaleViewState();
}

class _NewSaleViewState extends State<NewSaleView> {
  @override
  void initState() {
    super.initState();
    context.read<SaleCubit>().init();
  }

  void _onConfirmTapped() {
    final state = context.read<SaleCubit>().state;
    if (state is! SaleItemsUpdatedState || state.isEmpty) {
      AppSnackBar.show(
        context,
        message: S.of(context).emptyInvoice,
        type: SnackBarType.warning,
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColorsDarkMode.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => ConfirmDialog(
        state: state,
        onConfirm: () {
          context.read<SaleCubit>().confirmSale();
        },
      ),
    );
  }

  void _onDiscardTapped() {
    final state = context.read<SaleCubit>().state;
    if (state is SaleItemsUpdatedState && state.isEmpty) {
      context.pop();
      return;
    }

    showDialog(
      context: context,
      builder: (_) => DiscardDialog(
        onDiscard: () {
          context.pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SaleCubit, SaleState>(
      listener: (context, state) {
        if (state is SaleSuccessState) {
          context.pushReplacement(AppRoutes.saleSuccess, extra: state.sale);
        } else if (state is SaleErrorState) {
          AppSnackBar.show(
            context,
            message: state.errMessage,
            type: SnackBarType.error,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColorsDarkMode.background,
        appBar: AppBar(
          title: Text(
            S.of(context).newSale,
            style: AppStyles.priceBold16(context),
          ),
          leading: const SizedBox(),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _onDiscardTapped,
            ),
          ],
        ),
        body: NewSaleViewBody(onConfirmTapped: _onConfirmTapped),
      ),
    );
  }
}
