import 'package:flutter/material.dart';
import 'package:stock_mate/core/services/notification_service.dart';
import 'package:stock_mate/core/services/view/widgets/notification_handle.dart';
import 'package:stock_mate/core/services/view/widgets/notification_header.dart';
import 'package:stock_mate/core/services/view/widgets/notifications_list.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/di/service_locator.dart';

class NotificationCenterSheet extends StatefulWidget {
  const NotificationCenterSheet({super.key});

  @override
  State<NotificationCenterSheet> createState() =>
      _NotificationCenterSheetState();
}

class _NotificationCenterSheetState extends State<NotificationCenterSheet> {
  final NotificationService _service = getIt<NotificationService>();

  @override
  void initState() {
    super.initState();
    // When open the sheet, mark all notifications as read
    // Then setState to update the unread count in the app bar
    Future.microtask(() {
      _service.markAllAsRead();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifications = _service.getNotifications();

    return Container(
      decoration: const BoxDecoration(
        color: AppColorsDarkMode.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const NotificationHandle(),
          NotificationHeader(
            notifications: notifications,
            onPressed: () {
              _service.clearAll();
              setState(() {});
            },
          ),
          NotificationsList(notifications: notifications),
        ],
      ),
    );
  }
}
