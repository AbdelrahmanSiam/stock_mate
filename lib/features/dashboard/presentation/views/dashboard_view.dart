import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/di/service_locator.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/dashboard/presentation/manager/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/products_view_body.dart';
import 'package:stock_mate/features/sales/presentation/manager/cubits/sales_history_cubit/sales_history_cubit.dart';
import 'package:stock_mate/features/sales/presentation/views/sales_history_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key, this.productsInitialFilter});

  final String? productsInitialFilter;

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;
  late final ProductsCubit productsCubit;
  String? productsFilter;

  @override
  void initState() {
    super.initState();

    productsCubit = getIt<ProductsCubit>();

    // Dashboard data
    context.read<DashboardCubit>().getDashboardData();

    // Initial products load (with optional filter)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.productsInitialFilter != null) {
        currentIndex = 1;
        productsFilter = widget.productsInitialFilter;
        productsCubit.getProducts(initialFilter: widget.productsInitialFilter);
      } else {
        productsCubit.getProducts();
      }
    });
  }

  @override
  void dispose() {
    productsCubit.close();
    super.dispose();
  }

  void navigateToProductsWithFilter(String filter) {
    setState(() {
      currentIndex = 1;
      productsFilter = filter;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      productsCubit.getProducts(initialFilter: filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardViewBody(
        onLowStockTapped: () => navigateToProductsWithFilter("lowStock"),
        onAllProductsTapped: () => navigateToProductsWithFilter("all"),
        onViewAllSalesTapped: () => setState(() => currentIndex = 2),
      ),

      BlocProvider.value(value: productsCubit, child: ProductsViewBody()),

      BlocProvider(
        create: (context) => getIt<SalesHistoryCubit>()..getRecentSales(),
        child: SalesHistoryView(),
      ),
      const Center(child: Text("Settings")),
    ];

    return MultiBlocProvider(
      providers: [BlocProvider.value(value: productsCubit)],
      child: Scaffold(
        body: pages[currentIndex],

        floatingActionButton: _buildFAB(context),

        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() => currentIndex = index);

            if (index == 1) {
              if (productsCubit.state is ProductsInitialState) {
                productsCubit.getProducts();
              } else if (productsFilter != null) {
                productsCubit.getProducts(initialFilter: productsFilter!);
              }
            }
          },
        ),
      ),
    );
  }

  Widget? _buildFAB(BuildContext context) {
    if (currentIndex == 0) {
      return FloatingActionButton(
        backgroundColor: AppColorsDarkMode.primary,
        heroTag: 'dashboard_fab',
        onPressed: () {
          context.push(AppRoutes.newSale);
        },
        child: const Icon(Icons.add, color: Colors.white),
      );
    }

    if (currentIndex == 1) {
      return FloatingActionButton(
        backgroundColor: AppColorsDarkMode.primary,
        heroTag: 'products_fab',
        onPressed: () {
          context.push(AppRoutes.addEditProducts);
        },
        child: const Icon(Icons.add, color: Colors.white),
      );
    }

    return null;
  }
}
