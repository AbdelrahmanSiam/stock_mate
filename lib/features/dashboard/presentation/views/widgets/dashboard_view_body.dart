import 'package:flutter/cupertino.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Dashboard", style: TextStyle(fontSize: 50))),
      ],
    );
  }
}
