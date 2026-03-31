import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/theme/theme_data/app_theme_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardSection extends StatelessWidget {
  const LoginCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      child: Column(
        children: [
          CustomAuthTextField(
            label: S.of(context).email,
            hint: "mohamed@gmail.com",
            prefixIcon: Icons.email_outlined,
          ),
          const SizedBox(height: 16),
          CustomAuthTextField(
            label: S.of(context).password,
            hint: '••••••••',
            prefixIcon: Icons.lock_outlined,
            widget:Text("Forget?", style: AppStyles.priceBold16(context)),
          ),
        ],
      ),
    );
  }
}
