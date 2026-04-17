import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/add_edit_product_cubit/add_edit_product_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductDeleteDialog extends StatelessWidget {
  final String id;
  final String imageUrl;

  const ProductDeleteDialog({
    super.key,
    required this.id,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColorsDarkMode.surface,
      title: Text(
        S.of(context).deleteProduct,
        style: AppStyles.sectionTitleSemiBold16(context),
      ),
      content: Text(
        S.of(context).deleteProductConfirm,
        style: AppStyles.bodyMediumRegular14(context),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<AddEditProductCubit>().deleteProduct(
              id: id,
              imageUrl: imageUrl,
            );
          },
          child: Text(
            S.of(context).delete,
            style: TextStyle(color: AppColorsDarkMode.error),
          ),
        ),
      ],
    );
  }
}
