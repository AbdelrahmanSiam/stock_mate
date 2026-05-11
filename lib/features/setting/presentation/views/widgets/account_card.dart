import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_list_tile.dart';
import 'package:stock_mate/generated/l10n.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).account,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
        SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: AppColorsDarkMode.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColorsDarkMode.border),
          ),
          child: Column(
            children: [
              CustomListTile(
                leadingIcon: Icons.person,
                trailingIcon: Icons.arrow_forward_ios,
                title: S.of(context).displayName,
                subTitle: "Abdelrahman",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
