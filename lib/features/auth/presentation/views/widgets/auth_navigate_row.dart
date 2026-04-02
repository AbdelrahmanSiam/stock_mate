import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class AuthNavigateRow extends StatelessWidget {
  const AuthNavigateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).haveNoAccount,
          style: AppStyles.bodySmallRegular12(context),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.register);
          },
          child: Text(
            S.of(context).registerHere,
            style: AppStyles.cardTitleSemiBold14(
              context,
            ).copyWith(color: AppColorsDarkMode.primary),
          ),
        ),
      ],
    );
  }
}
