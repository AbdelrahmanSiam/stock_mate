import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/presentation/manager/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_content.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_error_view.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_header_widget.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/recent_sales_section.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/stat_cards_grid.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/weekly_sales_chart.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});
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
            return DashboardContent(isLoading: false, dashboard: dashboard);
          } else {
            return const DashboardContent(isLoading: true ,);
          }
        },
      ),
    );
  }
}
