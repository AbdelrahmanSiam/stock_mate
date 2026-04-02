import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class AuthNavigateRow extends StatelessWidget {
  const AuthNavigateRow({super.key, required this.text, required this.navName});
  final String text;
  final String navName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppStyles.bodySmallRegular12(context),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.register);
          },
          child: Text(
            navName,
            style: AppStyles.cardTitleSemiBold14(
              context,
            ).copyWith(color: AppColorsDarkMode.primary),
          ),
        ),
      ],
    );
  }
}
