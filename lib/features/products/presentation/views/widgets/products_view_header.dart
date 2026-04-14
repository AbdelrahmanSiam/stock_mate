import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/widgets/custom_notification_icon.dart';
import 'package:stock_mate/core/utils/widgets/custom_user_avatar.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomUserAvatar(),
            const SizedBox(width: 12),
            Text('Products', style: AppStyles.priceBold16(context)),
          ],
        ),
        CustomNotificationIcon(onTap: () {}),
      ],
    );
  }
}
