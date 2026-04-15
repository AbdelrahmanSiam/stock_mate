import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/products/presentation/views/widgets/stepper_button.dart';

class QuantityStepperWidget extends StatelessWidget {
  const QuantityStepperWidget({
    super.key,
    required this.value,
    this.onDecrement,
    this.onIncrement,
  });
  final int value;
  final void Function()? onDecrement, onIncrement;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColorsDarkMode.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StepperButton(
            icon: Icons.remove,
            onTap: value > 0 ? onDecrement : null,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$value',
              style: AppStyles.labelSemiBold13(context).copyWith(
                color: AppColorsDarkMode.textSecondary.withValues(alpha: 0.5),
              ),
            ),
          ),
          Spacer(),
          StepperButton(icon: Icons.add, onTap: onIncrement),
        ],
      ),
    );
  }
}
