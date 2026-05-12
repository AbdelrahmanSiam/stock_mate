import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/cusotm_icon_with_container.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.title,
    required this.subTitle,
    this.onTap,
  });
  final IconData leadingIcon, trailingIcon;
  final String title, subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: CustomIconWithContainer(
          leadingIcon: leadingIcon,
          color: AppColorsDarkMode.textSecondary,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.labelSemiBold13(
                context,
              ).copyWith(color: AppColorsDarkMode.textSecondary),
            ),
            SizedBox(height: 4),
            Text(subTitle, style: AppStyles.buttonSemiBold15(context)),
          ],
        ),
        trailing: Icon(
          trailingIcon,
          size: 16,
          color: AppColorsDarkMode.textSecondary,
        ),
      ),
    );
  }
}
