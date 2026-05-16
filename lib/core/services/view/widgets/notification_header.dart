import 'package:flutter/material.dart';
import 'package:stock_mate/core/services/models/notification_model.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/generated/l10n.dart';

class NotificationHeader extends StatefulWidget {
  final void Function() onPressed;
  final List<NotificationModel> notifications;
  const NotificationHeader({
    super.key,
    required this.onPressed,
    required this.notifications,
  });

  @override
  State<NotificationHeader> createState() => _NotificationHeaderState();
}

class _NotificationHeaderState extends State<NotificationHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).notifications,
          style: AppStyles.sectionTitleSemiBold16(context),
        ),
        if(widget.notifications.isNotEmpty)
        TextButton(
          onPressed: widget.onPressed,
          child: Text(
            S.of(context).clear_all,
            style: AppStyles.bodySmallRegular12(
              context,
            ).copyWith(color: AppColorsDarkMode.error),
          ),
        ),
      ],
    );
  }
}
