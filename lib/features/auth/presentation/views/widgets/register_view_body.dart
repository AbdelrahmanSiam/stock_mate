import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/auth_navigate_row.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/register_card_form.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/register_view_header.dart';
import 'package:stock_mate/generated/l10n.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RegisterViewHeader(),
          RegisterCardForm(),
          const SizedBox(height: 28),
          AuthNavigateRow(
            text: S.of(context).haveAccount,
            navName: S.of(context).signInButton,
            onTap: () {
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
