import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width * 0.12;
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final user = switch (state) {
          SettingsSuccessState() => (state as SettingsSuccessState).user,
          SettingsSavingState() => (state as SettingsSavingState).user,
          SettingsLogoUploadingState() =>
            (state as SettingsLogoUploadingState).user,
          SettingsSavedState() => (state as SettingsSavedState).user,
          SettingsErrorState() => (state as SettingsErrorState).user,
          _ => null,
        };

        final String logoUrl = user?.shopLogoUrl ?? '';
        final String displayName = user?.displayName ?? '';
        final String firstLetter = displayName.isNotEmpty
            ? displayName[0].toUpperCase()
            : '?';

        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColorsDarkMode.surface,
            border: Border.all(color: AppColorsDarkMode.border, width: 1),
          ),
          child: ClipOval(
            child: logoUrl.isNotEmpty
                // If there's a logo URL, try to load it, otherwise fallback to letter avatar
                ? CachedNetworkImage(
                  width: size,
                  height: size,
                    imageUrl: logoUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => _letterAvatar(context, firstLetter),
                    errorWidget: (_, __, ___) =>
                        _letterAvatar(context, firstLetter),
                  )
                // If there's no logo URL, display a letter avatar
                : _letterAvatar(context, firstLetter),
          ),
        );
      },
    );
  }

  Widget _letterAvatar(BuildContext context, String letter) {
    return Center(
      child: Text(
        letter,
        style: AppStyles.sectionTitleSemiBold16(
          context,
        ).copyWith(color: AppColorsDarkMode.primary),
      ),
    );
  }
}
