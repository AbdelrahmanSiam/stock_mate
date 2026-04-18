import 'package:stock_mate/features/dashboard/data/models/dashboard_model.dart';

abstract class DashboardRemoteDataSource {
  Stream<DashboardModel> getDashboardData();
}
