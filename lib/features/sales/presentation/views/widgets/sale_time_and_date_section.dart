import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class SaleDateAndTimeSection extends StatelessWidget {
  const SaleDateAndTimeSection({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    // Convert DateTime to formatted string
    final String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
    final String formattedTime = DateFormat('HH:mm a').format(dateTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).dateAndTime,
          style: AppStyles.captionRegular10(context).copyWith(
            letterSpacing: 1.5,
            color: AppColorsDarkMode.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '$formattedDate • $formattedTime',
          style: AppStyles.labelSemiBold13(context),
        ),
      ],
    );
  }
}
