import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/domain/entities/recent_sale_entity.dart';
import 'package:stock_mate/features/sales/domain/entities/sale_filter.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sales_history_cubit/sales_history_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_filter_tabs.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_history_list.dart';
import 'package:stock_mate/features/sales/presentation/views/widgets/sales_summary_card.dart';
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
                    SalesSummaryCard(totalSales: 40, grossRevenue: 4200),
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
              SalesHistoryList(
                sale: RecentSaleEntity(
                  invoiceNumber: "INV-10index",
                  paymentMethod: "Cash",
                  totalAmount: 200,
                  createdAt: DateTime.now(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
