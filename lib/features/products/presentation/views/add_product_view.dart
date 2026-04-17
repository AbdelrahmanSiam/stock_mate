import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/domain/entities/product_entity.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/add_product_view_body.dart';
import 'package:stock_mate/generated/l10n.dart';

class AddProductView extends StatelessWidget {
  final ProductEntity? product;
  const AddProductView({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          product == null
              ? S.of(context).addProduct
              : S.of(context).editProduct,
          style: AppStyles.statValueBold24(
            context,
          ).copyWith(color: AppColorsDarkMode.primary),
        ),
      ),
      body: AddProductViewBody(product),
    );
  }
}
