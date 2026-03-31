import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/app_card.dart';
import 'package:stock_mate/features/auth/presentation/views/widgets/login_view_header.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          LoginViewHeader(),
          const SizedBox(height: 32),
          AppCard(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            child: Column(
              children: [TextField(), SizedBox(height: 50), TextField()],
            ),
          ),
        ],
      ),
    );
  }
}
