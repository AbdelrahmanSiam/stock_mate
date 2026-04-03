import 'package:flutter/material.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class EmailVerificationIcon extends StatelessWidget {
  const EmailVerificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0XFF1B1F2C),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColorsDarkMode.primary.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Icon(Icons.email, color: AppColorsDarkMode.primary, size: 50),
    );
  }
}
