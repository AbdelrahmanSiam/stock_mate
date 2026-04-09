import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/presentation/views/helper/helper.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_avatar.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_text.dart';

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
            DashboardHeaderText(displayName: displayName, shopName: shopName),
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
              border: Border.all(color: AppColorsDarkMode.border, width: 1),
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
