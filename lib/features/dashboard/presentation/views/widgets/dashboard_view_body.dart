import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_view_body.dart';
import 'package:stock_mate/features/dashboard/presentation/manager/cubits/dashboard_cubit/dashboard_cubit.dart';
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
          if (state is DashboardLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColorsDarkMode.primary,
              ),
            );
          }
          if (state is DashboardErrorState) {
            return DashboardErrorView(errMessage: state.errMessage);
          }
          if (state is DashboardLoadedState) {
            final dashboard = state.dashboard;
            return Column(
              children: [
                Spacer(),
                DashboardHeaderWidget(
                  displayName: 'Abdul-Rahman',
                  shopName: 'Al-Baraka',
                ),
                const SizedBox(height: 30),
                StatCardsGrid(dashboard: dashboard),
                const SizedBox(height: 30),
                WeeklySalesChart(salesData: dashboard.weeklySalesAmounts),
                const SizedBox(height: 30),
                RecentSalesSection(sales: dashboard.recentSales),
                Spacer(),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
