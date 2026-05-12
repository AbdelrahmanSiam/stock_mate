import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_mate/core/router/app_router.dart';
import 'package:stock_mate/core/utils/widgets/app_snack_bar.dart';
import 'package:stock_mate/core/utils/widgets/custom_error_state_widget.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';
import 'package:stock_mate/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/account_card.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/danger_zone.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/preferences_card.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/setting_view_header.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/settings_skeletonizer_widget.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/shop_info_card.dart';
import 'package:stock_mate/generated/l10n.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        //  Logout →  Login
        if (state is SettingsLoggedOutState) {
          context.go(AppRoutes.login);
        }
        //  Saved → Snackbar
        if (state is SettingsSavedState) {
          AppSnackBar.show(
            context,
            message: S.of(context).changesSaved,
            type: SnackBarType.success,
          );
        }
        // Error → Snackbar
        if (state is SettingsErrorState) {
          AppSnackBar.show(
            context,
            message: state.errMessage,
            type: SnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        if (state is SettingsInitialState) {
          return SettingsSkeletonizerWidget();
        }
        if (state is SettingsLoadingState) {
          return SettingsSkeletonizerWidget();
        }
        if (state is SettingsErrorState && state.user == null) {
          return CustomErrorStateWidget(
            errMessage: state.errMessage,
            onPressed: () => context.read<SettingsCubit>().getUserData(),
          );
        }
        final user = _getUser(state);
        if (user == null) return const SettingsSkeletonizerWidget();

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingViewHeader(),
                const SizedBox(height: 20),
                ShopInfoCard(
                  user: user,
                  isSaving: state is SettingsSavingState,
                  isUploadingLogo: state is SettingsLogoUploadingState,
                ),
                const SizedBox(height: 20),
                AccountCard(user: user),
                const SizedBox(height: 20),
                PreferencesCard(),
                const SizedBox(height: 20),
                DangerZone(),
              ],
            ),
          ),
        );
      },
    );
  }

  SettingsUserEntity? _getUser(SettingsState state) => switch (state) {
    SettingsSuccessState() => (state as SettingsSuccessState).user,
    SettingsSavingState() => (state as SettingsSavingState).user,
    SettingsLogoUploadingState() => (state as SettingsLogoUploadingState).user,
    SettingsSavedState() => (state as SettingsSavedState).user,
    SettingsErrorState() => (state as SettingsErrorState).user,
    _ => null,
  };
}
