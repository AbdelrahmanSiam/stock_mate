part of 'dashboard_cubit.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitialState extends DashboardState {}

final class DashboardLoadingState extends DashboardState {}

final class DashboardLoadedState extends DashboardState {
  final DashboardEntity dashboard;
   DashboardLoadedState(this.dashboard);
}

final class DashboardErrorState extends DashboardState {
  final String errMessage;
   DashboardErrorState(this.errMessage);
}