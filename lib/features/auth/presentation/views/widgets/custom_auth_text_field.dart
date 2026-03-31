import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.label,
    required this.hint,
  });
  final String label, hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: Color(0XFFE2BFB3)),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
