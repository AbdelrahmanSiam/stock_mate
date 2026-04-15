import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image_picker_widget.dart';
import 'package:stock_mate/generated/l10n.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        children: [
          ProductImagePickerWidget(),
          const SizedBox(height: 24),
          CustomTextField(
            label: S.of(context).productName,
            hint: S.of(context).productNameHint,
            prefixIcon: Icons.inventory_2_outlined,
            controller: nameController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: S.of(context).category,
            hint: S.of(context).categoryHint,
            prefixIcon: Icons.category_outlined,
            controller: categoryController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: S.of(context).barcode,
            hint: S.of(context).barcodeHint,
            prefixIcon: Icons.qr_code_scanner_outlined,
            controller: barcodeController,
          ),
        ],
      ),
    );
  }
}
