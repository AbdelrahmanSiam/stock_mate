import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class CustomErrorStateWidget extends StatelessWidget {
  final String errMessage;
  final void Function() onPressed;
  const CustomErrorStateWidget({
    super.key,
    required this.errMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColorsDarkMode.error,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              errMessage,
              style: AppStyles.bodyMediumRegular14(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onPressed,
              child: Text(S.of(context).retry),
            ),
          ],
        ),
      ),
    );
  }
}
