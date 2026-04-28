import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/domain/use_case/get_dashboard_usecase.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  StreamSubscription? subscription;
  final GetDashboardUseCase getDashboardUseCase;
  DashboardCubit({required this.getDashboardUseCase})
    : super(DashboardInitialState());

  Future<void> getDashboardData() async {
    emit(DashboardLoadingState());
    subscription = getDashboardUseCase.call().listen(
      (result) {
        result.fold(
          (failure) {
            emit(DashboardErrorState(failure.errMessage));
          },
          (dashboard) {
            emit(DashboardLoadedState(dashboard));
          },
        );
      },
      onError: (error) {
        emit(DashboardErrorState(error.toString()));
      },
    );
  }
  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
