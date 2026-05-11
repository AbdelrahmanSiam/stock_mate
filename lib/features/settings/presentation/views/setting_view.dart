import 'package:flutter/material.dart';
import 'package:stock_mate/features/settings/presentation/views/widgets/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SettingViewBody(),
    );
  }
}
