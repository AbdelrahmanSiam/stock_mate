import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/cubit/cubit/locale_cubit.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/preferences_row.dart';
import 'package:stock_mate/generated/l10n.dart';

class PreferencesCard extends StatelessWidget {
  const PreferencesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LocaleCubit>().state;
    final languageCode = state is LocaleLoadedState
        ? state.locale.languageCode
        : 'en';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).preferences,
          style: AppStyles.labelSemiBold13(
            context,
          ).copyWith(color: AppColorsDarkMode.textSecondary),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColorsDarkMode.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColorsDarkMode.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                PreferencesRow(
                  icon: Icons.language,
                  title: S.of(context).language,
                  subTitle: languageCode == 'en' ? 'English' : 'العربية',
                  color: Color(0XFFFFDB9D),
                  onTap: () => _showLanguagePicker(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void _showLanguagePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColorsDarkMode.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      final languages = [('en', 'English', '🇬🇧'), ('ar', 'العربية', '🇸🇦')];
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.map((lang) {
            final (code, name, flag) = lang;
            return ListTile(
              leading: Text(flag, style: const TextStyle(fontSize: 24)),
              title: Text(name, style: AppStyles.bodyMediumRegular14(context)),
              onTap: () {
                Navigator.pop(context);
                context.read<LocaleCubit>().changeLocal(code);
              },
            );
          }).toList(),
        ),
      );
    },
  );
}
