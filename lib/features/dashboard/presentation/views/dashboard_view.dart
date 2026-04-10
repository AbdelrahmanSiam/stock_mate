import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/dashboard/presentation/manager/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().getDashboardData();
  }

  int currentIndex = 0;
  final pages = [
    const DashboardViewBody(),
    Center(child: Text("Products")),
    Center(child: Text("Sales")),
    Center(child: Text("Settings")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add product screen
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
