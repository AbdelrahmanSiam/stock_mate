import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/presentation/views/helper/helper.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_avatar.dart';

class DashboardHeaderWidget extends StatelessWidget {
  final String displayName;
  final String shopName;

  const DashboardHeaderWidget({
    super.key,
    required this.displayName,
    required this.shopName,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            DashboardAvatar(displayName: displayName),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting
                Text(
                  '${getGreeting()}, $displayName ${getGreetingEmoji()}',
                  style: AppStyles.bodyMediumRegular14(context),
                ),
                const SizedBox(height: 2),
                // Shop name بالـ primary color
                Text(
                  shopName,
                  style: AppStyles.labelSemiBold13(context).copyWith(
                    color: AppColorsDarkMode.primary,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Notification bell
        GestureDetector(
          onTap: () {
            // TODO: Notifications
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColorsDarkMode.surface,
              border: Border.all(
                color: AppColorsDarkMode.border,
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.notifications_outlined,
              color: AppColorsDarkMode.textPrimary,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
