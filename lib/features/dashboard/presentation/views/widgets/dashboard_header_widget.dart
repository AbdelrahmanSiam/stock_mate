import 'package:flutter/material.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_avatar.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_text.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_notification.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            DashboardAvatar(displayName: "User"),
            const SizedBox(width: 12),
            DashboardHeaderText(displayName: "User", shopName: "User's Shop"),
          ],
        ),
        DashboardNotification(
          onTap: () {
            // go to notifications screen
          },
        ),
      ],
    );
  }
}
