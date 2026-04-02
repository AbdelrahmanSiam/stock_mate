import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.buttonName,
    this.color = Colors.black,
  });

  final void Function()? onPressed;
  final bool isLoading;
  final String buttonName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              buttonName,
              style: AppStyles.buttonSemiBold15(context).copyWith(color: color),
            ),
    );
  }
}
