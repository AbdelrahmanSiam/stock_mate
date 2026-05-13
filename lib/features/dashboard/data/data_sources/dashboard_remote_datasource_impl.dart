import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stock_mate/core/constants/constants.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/dashboard_remote_datasource.dart';
import 'package:stock_mate/features/dashboard/data/data_sources/helper.dart';
import 'package:stock_mate/features/dashboard/data/models/dashboard_model.dart';

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final FirebaseFirestore firestore;

  const DashboardRemoteDataSourceImpl({required this.firestore});

  @override
  Stream<DashboardModel> getDashboardData() {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final monthStart = DateTime(now.year, now.month, 1);
    final weekStart = todayStart.subtract(const Duration(days: 6));

    // Products realtime stream
    final productsStream = firestore
        .collection(kProductsCollection)
        .snapshots();
    // Sales realtime stream for current month and weekly chart data.
    final salesStream = firestore
        .collection(kSalesCollection)
        .where(
          kCreatedAt,
          isGreaterThanOrEqualTo: Timestamp.fromDate(monthStart),
        )
        .orderBy(kCreatedAt, descending: true)
        .snapshots();

    // Combine both streams using Rx dart
    return Rx.combineLatest2(productsStream, salesStream, (
      QuerySnapshot<Map<String, dynamic>> productsSnapshot,
      QuerySnapshot<Map<String, dynamic>> salesSnapshot,
    ) {
      return buildDashboard(
        productsSnapshot: productsSnapshot,
        salesSnapshot: salesSnapshot,
        todayStart: todayStart,
        monthStart: monthStart,
        weekStart: weekStart,
      );
    });
  }
}
