import 'package:flutter/material.dart';
import 'package:stock_mate/generated/l10n.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });
  final int currentIndex;
  final void Function(int) onDestinationSelected;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      height: MediaQuery.of(context).size.height * 0.08,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.dashboard_outlined),
          label: S.of(context).dashboard,
        ),
        NavigationDestination(
          icon: Icon(Icons.inventory_2_outlined),
          label: S.of(context).products,
        ),
        NavigationDestination(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: S.of(context).sales,
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          label: S.of(context).settings,
        ),
      ],
    );
  }
}
