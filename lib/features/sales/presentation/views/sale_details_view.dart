import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class SaleDetailsView extends StatelessWidget {
  const SaleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppColorsDarkMode.primary),
        ),
        title: Text(
          "INV-834789419",
          style: AppStyles.buttonSemiBold15(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: AppColorsDarkMode.textSecondary,
            ),
            onPressed: () {
              //  Share invoice
            },
          ),
        ],
      ),
    );
  }
}
