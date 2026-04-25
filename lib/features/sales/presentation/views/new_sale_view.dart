import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_snack_bar.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sale_cubit/sale_cubit.dart';
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

    _showConfirmDialog(state);
  }

  void _showConfirmDialog(SaleItemsUpdatedState state) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColorsDarkMode.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColorsDarkMode.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).confirmSaleTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              S
                  .of(context)
                  .confirmSaleMessage(
                    state.totalItemsCount,
                    state.subTotal.toStringAsFixed(2),
                  ),
              style: TextStyle(
                fontSize: 14,
                color: AppColorsDarkMode.textSecondary,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(S.of(context).cancel),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<SaleCubit>().confirmSale();
                    },
                    child: Text(S.of(context).confirmSale),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
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
          title: Text(S.of(context).newSale, style: AppStyles.priceBold16(context)),
          leading: const SizedBox(),
          actions: [
            // X button للـ discard
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _showDiscardDialog,
            ),
          ],
        ),
        body: NewSaleViewBody(onConfirmTapped: _onConfirmTapped),
      ),
    );
  }

  void _showDiscardDialog() {
    final state = context.read<SaleCubit>().state;

    // لو الـ invoice فاضية → نرجع مباشرة
    if (state is SaleItemsUpdatedState && state.isEmpty) {
      context.pop();
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColorsDarkMode.surface,
        title: Text(
          S.of(context).discardSale,
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(
          S.of(context).discardSaleMessage,
          style: TextStyle(color: AppColorsDarkMode.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop();
            },
            child: Text(
              S.of(context).discard,
              style: TextStyle(color: AppColorsDarkMode.error),
            ),
          ),
        ],
      ),
    );
  }
}
