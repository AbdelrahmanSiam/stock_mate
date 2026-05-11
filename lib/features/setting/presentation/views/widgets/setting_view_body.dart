import 'package:flutter/widgets.dart';
import 'package:stock_mate/features/setting/presentation/views/widgets/setting_view_header.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [SettingViewHeader()]),
    );
  }
}
