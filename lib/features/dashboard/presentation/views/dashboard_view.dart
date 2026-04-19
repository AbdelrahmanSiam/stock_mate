import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/di/service_locator.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';
import 'package:stock_mate/features/products/presentation/manager/cubits/products_cubit/products_cubit.dart';
import 'package:stock_mate/features/products/presentation/views/products_view_body.dart';

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
    productsCubit = getIt<ProductsCubit>();
    super.initState();
  }

  @override
  void dispose() {
    productsCubit.close();
    super.dispose();
  }

  void navigateProductsWithFilter(String filter) {
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
        onLowStockTapped: () => navigateProductsWithFilter("lowStock"),
        onAllProductsTapped: () => navigateProductsWithFilter("all"),
      ),
      BlocProvider.value(value: productsCubit, child: ProductsViewBody()),
      Center(child: Text("Sales")),
      Center(child: Text("Settings")),
    ];
    return Scaffold(
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(AppRoutes.addEditProducts);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
          if (index == 1 && productsCubit.state is ProductsInitialState) {
            productsCubit.getProducts();
          }
        },
      ),
    );
  }
}
