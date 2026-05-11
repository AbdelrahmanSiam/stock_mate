import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/utils/widgets/cusotm_icon_with_container.dart';

class PreferencesRow extends StatelessWidget {
  const PreferencesRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.color,
  });
  final IconData icon;
  final Color color;
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconWithContainer(leadingIcon: icon, color: color),
        SizedBox(width: 12),
        Text(title, style: AppStyles.buttonSemiBold15(context)),
        Spacer(),
        Row(
          children: [
            Text(
              subTitle,
              style: AppStyles.priceBold16(
                context,
              ).copyWith(color: Color(0XFFFFB59A)),
            ),
            Icon(Icons.arrow_drop_down, size: 16, color: Color(0XFFFFB59A)),
          ],
        ),
      ],
    );
  }
}
