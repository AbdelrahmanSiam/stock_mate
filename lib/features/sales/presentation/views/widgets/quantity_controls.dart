import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/control_btn.dart';

class QuantityControls extends StatelessWidget {
  final int quantity;
  final bool canIncrease;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityControls({
    required this.quantity,
    required this.canIncrease,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ControlBtn(icon: Icons.remove, onTap: onDecrement, enabled: true),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('$quantity', style: AppStyles.labelSemiBold13(context)),
        ),
        ControlBtn(
          icon: Icons.add,
          onTap: canIncrease ? onIncrement : null,
          enabled: canIncrease,
        ),
      ],
    );
  }
}
