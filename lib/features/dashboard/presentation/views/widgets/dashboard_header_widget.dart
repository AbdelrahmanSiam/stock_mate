import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/core/utils/widgets/custom_user_avatar.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_text.dart';
import 'package:stock_mate/core/utils/widgets/custom_notification_icon.dart';
import 'package:stock_mate/generated/l10n.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomUserAvatar(),
            const SizedBox(width: 12),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return DashboardHeaderText(
                  displayName: state is AuthSuccessState
                      ? state.user.displayName
                      : S.of(context).user,
                  shopName: state is AuthSuccessState
                      ? state.user.shopName
                      : S.of(context).shop,
                );
              },
            ),
          ],
        ),
        CustomNotificationIcon(onTap: () {}),
      ],
    );
  }
}
