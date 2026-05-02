import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_error_state_widget.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_filter.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sales_history_cubit/sales_history_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sale_history_skeleton.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_filter_tabs.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_history_empty_state.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_history_list.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_summary_card.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_summary_card_skeletonizer.dart';
import 'package:stock_mate/generated/l10n.dart';

class SalesHistoryViewBody extends StatelessWidget {
  const SalesHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesHistoryCubit, SalesHistoryState>(
      builder: (context, state) {
        final activeFilter = state is SalesHistorySuccessState
            ? state.activeFilter
            : SaleFilter.today;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                toolbarHeight: 70,
                elevation: 0,
                backgroundColor: AppColorsDarkMode.background,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                title: SalesFilterTabs(
                  activeFilter: activeFilter,
                  onFilterChanged: (filter) {
                    context.read<SalesHistoryCubit>().changeFilter(filter);
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    if (state is SalesHistorySuccessState)
                      SalesSummaryCard(
                        totalSales: state.transactionVolume,
                        grossRevenue: state.grossRevenue,
                      ),
                    if (state is SalesHistoryLoadingState)
                      SalesSummaryCardSkeletonizer(),
                    const SizedBox(height: 32),
                    Text(
                      S.of(context).recentTransactions,
                      style: AppStyles.labelSemiBold13(
                        context,
                      ).copyWith(color: AppColorsDarkMode.textSecondary),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              if (state is SalesHistoryLoadingState)
                SliverToBoxAdapter(child: const SaleHistorySkeleton())
              else if (state is SalesHistoryErrorState)
                SliverToBoxAdapter(
                  child: CustomErrorStateWidget(
                    errMessage: state.errMessage,
                    onPressed: () =>
                        context.read<SalesHistoryCubit>().getRecentSales(),
                  ),
                )
              else if (state is SalesHistorySuccessState)
                state.sales.isEmpty
                    ? SliverToBoxAdapter(
                        child: SalesHistoryEmptyState(isFiltered: true),
                      )
                    : SalesHistoryList(
                        sales: state.sales,
                        onTap: (sale) => context.push(AppRoutes.saleDetails, extra: sale.id),
                      )
              else
                const SalesHistoryEmptyState(isFiltered: false),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        );
      },
    );
  }
}
