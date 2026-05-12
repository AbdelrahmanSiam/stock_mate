import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/cusotm_icon_with_container.dart';
import 'package:stock_mate/core/utils/widgets/custom_confirm_dialog.dart';
import 'package:stock_mate/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class DangerZone extends StatelessWidget {
  const DangerZone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).dangerZone,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: Color(0XFFFFB4AB)),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColorsDarkMode.error.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColorsDarkMode.error.withValues(alpha: 0.3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                CustomIconWithContainer(
                  leadingIcon: Icons.logout,
                  color: Color(0XFFFFB4AB),
                ),
                SizedBox(width: 12),
                Text(
                  S.of(context).logout,
                  style: AppStyles.priceBold16(
                    context,
                  ).copyWith(color: Color(0XFFFFB4AB)),
                ),
                Spacer(),
                GestureDetector(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0XFFFFB4AB),
                  ),
                  onTap: () {
                    CustomConfirmDialog(
                      title: S.of(context).logoutConfirmTitle,
                      message: S.of(context).logoutConfirmMessage,
                      onConfirm: () {
                        Navigator.pop(context);
                        context.read<SettingsCubit>().logout();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
