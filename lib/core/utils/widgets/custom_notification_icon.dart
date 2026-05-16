import 'package:flutter/material.dart';
import 'package:stock_mate/core/di/service_locator.dart';
import 'package:stock_mate/core/services/notification_service.dart';
import 'package:stock_mate/core/services/view/notification_center_sheet.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';

class CustomNotificationIcon extends StatefulWidget {
  const CustomNotificationIcon({super.key});

  @override
  State<CustomNotificationIcon> createState() => _CustomNotificationIconState();
}

class _CustomNotificationIconState extends State<CustomNotificationIcon> {
  final NotificationService _service = getIt<NotificationService>();

  void _openNotificationCenter() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const NotificationCenterSheet(),
    ).then((_) {
      // Refresh the state when the sheet is closed to update the unread count badge
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final int unreadCount = _service.getUnreadCount();

    return GestureDetector(
      onTap: _openNotificationCenter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
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

          if (unreadCount > 0)
            Positioned(
              top: -2,
              right: -2,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColorsDarkMode.error,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: Text(
                  unreadCount > 9 ? '9+' : '$unreadCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
