import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_avatar.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_text.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_notification.dart';

class DashboardHeaderWidget extends StatelessWidget {


  const DashboardHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccessState) {
              final user = state.user;
              return Row(
                children: [
                  DashboardAvatar(displayName: user.displayName ),
                  const SizedBox(width: 12),
                  DashboardHeaderText(
                    displayName: user.displayName ,
                    shopName: user.shopName,
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  DashboardAvatar(displayName: "User"),
                  const SizedBox(width: 12),
                  DashboardHeaderText(
                    displayName: "User",
                    shopName: "User's Shop",
                  ),
                ],
              );
            }
          },
        ),
        DashboardNotification(
          onTap: () {
            // go to notifications screen
          },
        ),
      ],
    );
  }
}
