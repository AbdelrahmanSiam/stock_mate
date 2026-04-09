import 'package:flutter/material.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_avatar.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_text.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_notification.dart';

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
        DashboardNotification(
          onTap: () {
            // go to notifications screen
          },
        ),
      ],
    );
  }
}
