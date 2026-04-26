import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class SelectedItemsText extends StatelessWidget {
  const SelectedItemsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          S.of(context).selectedItems,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
      ),
    );
  }
}
