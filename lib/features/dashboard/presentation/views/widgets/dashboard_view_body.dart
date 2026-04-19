import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:stock_mate/features/dashboard/presentation/manager/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_content.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_error_view.dart';

class DashboardViewBody extends StatefulWidget {
  const DashboardViewBody({
    super.key,
    required this.onLowStockTapped,
    required this.onAllProductsTapped,
  });
  final void Function() onLowStockTapped;
  final void Function() onAllProductsTapped;
  @override
  State<DashboardViewBody> createState() => _DashboardViewBodyState();
}

class _DashboardViewBodyState extends State<DashboardViewBody> {
  @override
  void initState() {
    super.initState();
    // Load current user if not already loaded
    final authCubit = context.read<AuthCubit>();
    if (authCubit.state is AuthInitialState) {
      authCubit.getCurrentUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomViewBody(
      widget: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardErrorState) {
            return DashboardErrorView(errMessage: state.errMessage);
          }
          if (state is DashboardLoadedState) {
            final dashboard = state.dashboard;
            return DashboardContent(
              isLoading: false,
              dashboard: dashboard,
              onLowStockTapped: widget.onLowStockTapped,
              onAllProductsTapped: widget.onAllProductsTapped,
            );
          } else {
            return DashboardContent(
              isLoading: true,
              onLowStockTapped: widget.onLowStockTapped,
              onAllProductsTapped: widget.onAllProductsTapped,
            );
          }
        },
      ),
    );
  }
}
