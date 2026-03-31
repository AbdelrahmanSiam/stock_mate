import 'package:flutter/material.dart';
import 'package:stock_mate/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DashboardViewBody());
  }
}
