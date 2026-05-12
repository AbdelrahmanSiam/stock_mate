import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_mate/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/settings_view_body.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingsView> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SettingsViewBody());
  }
}
