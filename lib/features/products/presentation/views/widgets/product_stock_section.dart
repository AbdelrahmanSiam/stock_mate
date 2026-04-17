import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/quantity_stepper_widget.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductStockSection extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final TextEditingController thresholdController;
  final String? Function(String?) validator;

  const ProductStockSection({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.thresholdController,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).initialQuantity,
                style: AppStyles.labelSemiBold13(context).copyWith(
                  color: AppColorsDarkMode.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              QuantityStepperWidget(
                value: quantity,
                onIncrement: onIncrement,
                onDecrement: onDecrement,
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
            validator: validator,
          ),
        ),
      ],
    );
  }
}