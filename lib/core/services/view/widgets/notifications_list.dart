import 'package:flutter/material.dart';
import 'package:stock_mate/core/services/models/notification_model.dart';
import 'package:stock_mate/core/services/view/widgets/notification_tile.dart';
import 'package:stock_mate/core/services/view/widgets/notifictation_empty.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class NotificationsList extends StatelessWidget {
  final List<NotificationModel> notifications;
  const NotificationsList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.6,
      ),
      child: notifications.isEmpty
          ? NotifictationEmpty()
          : ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              itemCount: notifications.length,
              separatorBuilder: (_, __) =>
                  Divider(color: AppColorsDarkMode.border, height: 1),
              itemBuilder: (_, index) =>
                  NotificationTile(notification: notifications[index]),
            ),
    );
  }
}
