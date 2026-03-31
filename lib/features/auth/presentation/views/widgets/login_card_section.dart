import 'package:flutter/material.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/custom_auth_text_field.dart';
import 'package:stock_mate/generated/l10n.dart';

class LoginCardSection extends StatelessWidget {
  const LoginCardSection({
    super.key,
  });

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
          ),
          const SizedBox(height: 16,),
          CustomAuthTextField(
            label: S.of(context).password,
            hint: '••••••••',
          ),
        ],
      ),
    );
  }
}

