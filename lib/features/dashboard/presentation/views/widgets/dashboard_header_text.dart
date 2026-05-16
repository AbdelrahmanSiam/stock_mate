import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/presentation/views/helper/helper.dart';

class DashboardHeaderText extends StatelessWidget {
  const DashboardHeaderText({
    super.key,
    required this.displayName,
    required this.shopName,
  });

  final String displayName;
  final String shopName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${getGreeting(context)}, ${displayName.split(' ').first} ${getGreetingEmoji()}',
          style: AppStyles.bodyMediumRegular14(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          shopName,
          style: AppStyles.priceBold16(context),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
