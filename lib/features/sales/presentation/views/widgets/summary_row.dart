import 'package:flutter/widgets.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  const SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppStyles.bodyMediumRegular14(context)),
        Text(
          value,
          style: AppStyles.bodyMediumRegular14(
            context,
          ).copyWith(color: AppColorsDarkMode.textPrimary),
        ),
      ],
    );
  }
}
