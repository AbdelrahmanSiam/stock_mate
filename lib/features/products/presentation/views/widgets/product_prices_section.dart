import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/custom_text_field.dart';
import 'package:stock_mate/generated/l10n.dart';

class ProductPricesSection extends StatelessWidget {
  final TextEditingController sellPriceController;
  final TextEditingController buyPriceController;
  final ValueChanged<String> onSellChanged;
  final ValueChanged<String> onBuyChanged;
  final String? Function(String?) validator;

  const ProductPricesSection({
    super.key,
    required this.sellPriceController,
    required this.buyPriceController,
    required this.onSellChanged,
    required this.onBuyChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: S.of(context).sellPrice,
            hint: '0.00',
            prefixIcon: Icons.attach_money_outlined,
            controller: sellPriceController,
            keyboardType: TextInputType.number,
            suffixText: S.of(context).egp,
            validator: validator,
            onChanged: onSellChanged,
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
            validator: validator,
            onChanged: onBuyChanged,
          ),
        ),
      ],
    );
  }
}