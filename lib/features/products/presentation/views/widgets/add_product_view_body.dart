import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/product_image_picker_widget.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/quantity_stepper_widget.dart';
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
  final TextEditingController sellPriceController = TextEditingController();
  final TextEditingController buyPriceController = TextEditingController();
  final TextEditingController thresholdController = TextEditingController();
  int quantity = 0;
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
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: S.of(context).sellPrice,
                  hint: '0.00',
                  prefixIcon: Icons.attach_money_outlined,
                  controller: sellPriceController,
                  keyboardType: TextInputType.number,
                  suffixText: S.of(context).egp,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomTextField(
                  label: S.of(context).buyPrice,
                  hint: '0.00',
                  prefixIcon: Icons.attach_money_outlined,
                  controller: buyPriceController,
                  keyboardType: TextInputType.number,
                  suffixText: S.of(context).egp,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).initialQuantity,
                      style: AppStyles.labelSemiBold13(
                        context,
                      ).copyWith(color: AppColorsDarkMode.textSecondary),
                    ),
                    const SizedBox(height: 8),
                    QuantityStepperWidget(
                      value: quantity,
                      onIncrement: () => setState(() => quantity++),
                      onDecrement: () => setState(() => quantity--),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomTextField(
                  label: S.of(context).lowStockAlert,
                  hint: '5',
                  prefixIcon: Icons.notifications_outlined,
                  controller: thresholdController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
        ],
      ),
    );
  }
}
