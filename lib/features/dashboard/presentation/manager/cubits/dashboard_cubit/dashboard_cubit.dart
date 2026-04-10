import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/dashboard/domain/entites/dashboard_entity.dart';
import 'package:stock_mate/features/dashboard/domain/use_case/get_dashboard_usecase.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardUseCase getDashboardUseCase;
  DashboardCubit({required this.getDashboardUseCase})
    : super(DashboardInitialState());

  Future<void> getDashboardData() async {
    emit(DashboardLoadingState());
    final result = await getDashboardUseCase.call();
    result.fold(
      (failure) => emit(DashboardErrorState(failure.errMessage)),
      (dashboard) => emit(DashboardLoadedState(dashboard)),
    );
  }
}
