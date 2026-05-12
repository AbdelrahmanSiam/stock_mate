import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:stock_mate/features/auth/domain/use_cases/logout_use_case/logout_use_case.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';
import 'package:stock_mate/features/settings/domain/use_cases/get_user_data_use_case/get_user_data_use_case.dart';
import 'package:stock_mate/features/settings/domain/use_cases/update_display_name_use_case/update_display_name_use_case.dart';
import 'package:stock_mate/features/settings/domain/use_cases/update_shop_name_use_case/update_shop_name_use_case.dart';
import 'package:stock_mate/features/settings/domain/use_cases/update_shop_name_use_case/update_shop_name_use_case_parameters.dart';
import 'package:stock_mate/features/settings/domain/use_cases/upload_shop_logo_use_case/upload_shop_logo_use_case.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetUserDataUseCase getUserDataUseCase;
  final UpdateShopNameUseCase updateShopNameUseCase;
  final UpdateDisplayNameUseCase updateDisplayNameUseCase;
  final UploadShopLogoUseCase uploadShopLogoUseCase;
  final LogoutUseCase logoutUseCase;
  SettingsCubit(
    this.getUserDataUseCase,
    this.updateShopNameUseCase,
    this.updateDisplayNameUseCase,
    this.uploadShopLogoUseCase,
    this.logoutUseCase,
  ) : super(SettingsInitialState());

  SettingsUserEntity? _getCurrentUser() {
    return switch (state) {
      SettingsSuccessState() => (state as SettingsSuccessState).user,
      SettingsSavingState() => (state as SettingsSavingState).user,
      SettingsLogoUploadingState() =>
        (state as SettingsLogoUploadingState).user,
      SettingsSavedState() => (state as SettingsSavedState).user,
      SettingsErrorState() => (state as SettingsErrorState).user,
      _ => null,
    };
  }

  Future<void> getUserData() async {
    emit(SettingsLoadingState());
    final result = await getUserDataUseCase.call();
    result.fold(
      (failure) => emit(SettingsErrorState(errMessage: failure.errMessage)),
      (user) => emit(SettingsSuccessState(user)),
    );
  }
  // We retrieve the current user from the current state.
  // We emit `SavingState` with the user so the UI displays "loading" in the button.
  // Optimistic update: We update the user's state immediately with `copyWith`.
  // Before the Firestore call finishes — so the UX appears quickly.
  // If the Firestore call is successful: We emit `SavedState`.
  // If it fails: We revert to the old user and emit `ErrorState`.
  Future<void> updateShopName(String shopName) async {
    final SettingsUserEntity? user = _getCurrentUser();
    if (user == null) return;
    final updatedUser = user.copyWith(shopName: shopName);
    emit(SettingsSavingState(updatedUser));
    final result = await updateShopNameUseCase.call(
      UpdateShopNameUseCaseParameters(shopName: shopName),
    );
    result.fold(
      (failure) =>
          emit(SettingsErrorState(user: user, errMessage: failure.errMessage)),
      (_) => emit(
        SettingsSavedState(
          user: updatedUser,
          message: 'Shop name updated successfully',
        ),
      ),
    );
  }
}
