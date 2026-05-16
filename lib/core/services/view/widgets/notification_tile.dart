
import 'package:flutter/material.dart';
import 'package:stock_mate/core/services/models/notification_model.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  const NotificationTile({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLowStock = notification.type == NotificationType.lowStock;

    final Color iconBg = isLowStock
        ? AppColorsDarkMode.secondary.withValues(alpha: 0.15)
        : AppColorsDarkMode.success.withValues(alpha: 0.15);
    final Color iconColor = isLowStock
        ? AppColorsDarkMode.secondary
        : AppColorsDarkMode.success;
    final IconData icon = isLowStock
        ? Icons.inventory_2_outlined
        : Icons.receipt_long_outlined;

    final String timeAgo = _formatTime(notification.createdAt);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: AppStyles.labelSemiBold13(context),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.body,
                  style: AppStyles.bodySmallRegular12(context),
                ),
                const SizedBox(height: 4),
                Text(timeAgo, style: AppStyles.captionRegular10(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}
