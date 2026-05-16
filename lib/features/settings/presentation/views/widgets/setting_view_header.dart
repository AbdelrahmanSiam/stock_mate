import 'package:flutter/widgets.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/widgets/custom_notification_icon.dart';
import 'package:stock_mate/core/utils/widgets/custom_user_avatar.dart';
import 'package:stock_mate/generated/l10n.dart';

class SettingViewHeader extends StatelessWidget {
  const SettingViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomUserAvatar(),
            const SizedBox(width: 12),
            Text(S.of(context).settings, style: AppStyles.priceBold16(context)),
          ],
        ),
        CustomNotificationIcon(),
      ],
    );
  }
}
