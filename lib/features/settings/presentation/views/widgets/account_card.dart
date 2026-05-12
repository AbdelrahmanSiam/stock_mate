import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/core/styles/app_styles.dart';
import 'package:stock_mate/core/theme/app_colors/app_colors_dark_mode.dart';
import 'package:stock_mate/core/utils/widgets/custom_list_tile.dart';
import 'package:stock_mate/features/settings/domain/enitites/settings_user_entity.dart';
import 'package:stock_mate/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:stock_mate/generated/l10n.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key, required this.user});
  final SettingsUserEntity user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).account,
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
          child: Column(
            children: [
              CustomListTile(
                leadingIcon: Icons.person,
                trailingIcon: Icons.arrow_forward_ios,
                title: S.of(context).displayName,
                subTitle: user.displayName,
                onTap: () => _showEditDisplayName(context, user.displayName),
              ),
              SizedBox(height: 10),
              CustomListTile(
                leadingIcon: Icons.email,
                trailingIcon: Icons.lock_outlined,
                title: S.of(context).emailReadOnly,
                subTitle: user.email,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void _showEditDisplayName(BuildContext context, String currentName) {
  final controller = TextEditingController(text: currentName);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColorsDarkMode.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.fromLTRB(
        24,
        24,
        24,
        MediaQuery.of(sheetContext).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColorsDarkMode.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).editDisplayName,
            style: AppStyles.sectionTitleSemiBold16(context),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller,
            autofocus: true,
            style: AppStyles.bodyMediumRegular14(context),
            decoration: const InputDecoration(),
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(sheetContext);
                context.read<SettingsCubit>().updateDisplayName(
                  controller.text.trim(),
                );
              },
              child: Text(S.of(context).save),
            ),
          ),
        ],
      ),
    ),
  );
}
