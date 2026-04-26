
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_button.dart';
import 'package:stock_mate/core/utils/widgets/custom_confirm_dialog.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/add_edit_product_cubit/add_edit_product_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/add_product_view_body.dart';
import 'package:stock_mate/generated/l10n.dart';

class DeleteProductButton extends StatelessWidget {
  const DeleteProductButton({
    super.key,
    required this.isDeleting,
    required this.widget,
  });

  final bool isDeleting;
  final AddProductViewBody widget;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: isDeleting
          ? null
          : () => showDialog(
              context: context,
              builder: (_) => CustomConfirmDialog(
                title: S.of(context).deleteProduct,
                message: S.of(context).deleteProductConfirm,
                confirmText: S.of(context).delete,
                cancelText: S.of(context).cancel,
                icon: Icons.delete_forever_rounded,
                iconColor: AppColorsDarkMode.error,
                onConfirm: () {
                  context
                      .read<AddEditProductCubit>()
                      .deleteProduct(
                        id: widget.product!.id,
                        imageUrl: widget.product!.imageUrl,
                      );
                },
              ),
            ),
      isLoading: isDeleting,
      buttonName: S.of(context).deleteProduct,
    );
  }
}
