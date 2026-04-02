import 'package:flutter/material.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_card_section.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_view_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Spacer(),
          LoginViewHeader(),
          const SizedBox(height: 32),
          LoginCardSection(),
          Spacer(),
        ],
      ),
    );
  }
}


