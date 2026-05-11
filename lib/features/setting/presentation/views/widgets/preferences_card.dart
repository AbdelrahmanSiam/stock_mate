import 'package:flutter/material.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/cusotm_icon_with_container.dart';
import 'package:stock_mate/features/setting/presentation/views/widgets/preferences_row.dart';
import 'package:stock_mate/generated/l10n.dart';

class PreferencesCard extends StatelessWidget {
  const PreferencesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).preferences,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColorsDarkMode.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColorsDarkMode.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                PreferencesRow(
                  icon: Icons.language,
                  title: S.of(context).language,
                  subTitle: S.of(context).language,
                  color: Color(0XFFFFDB9D),
                ),
                SizedBox(height: 20),
                PreferencesRow(
                  icon: Icons.currency_exchange,
                  title: S.of(context).currency,
                  subTitle: S.of(context).egp,
                  color: Color(0XFF6CD2FF),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
