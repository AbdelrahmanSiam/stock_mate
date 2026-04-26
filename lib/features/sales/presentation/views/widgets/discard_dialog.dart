import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class DiscardDialog extends StatelessWidget {
  const DiscardDialog({
    super.key,
    required this.onDiscard,
  });

  final VoidCallback onDiscard;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColorsDarkMode.surface,
      title: Text(
        S.of(context).discardSale,
        style: const TextStyle(color: Colors.white),
      ),
      content: Text(
        S.of(context).discardSaleMessage,
        style: TextStyle(
          color: AppColorsDarkMode.textSecondary,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onDiscard();
          },
          child: Text(
            S.of(context).discard,
            style: TextStyle(
              color: AppColorsDarkMode.error,
            ),
          ),
        ),
      ],
    );
  }
}