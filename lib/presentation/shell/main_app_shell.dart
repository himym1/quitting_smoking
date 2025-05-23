// lib/presentation/shell/main_app_shell.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';

class MainAppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainAppShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell, // Display the current branch's Navigator
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: AppLocalizations.of(context).bottomNavHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.emoji_events_outlined),
            activeIcon: const Icon(Icons.emoji_events),
            label: AppLocalizations.of(context).bottomNavAchievements,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: AppLocalizations.of(context).bottomNavSettings,
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) {
          navigationShell.goBranch(
            index,
            // Support navigating to the initial location when tapping the item that is already active
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        // Consider adding selectedItemColor, unselectedItemColor from AppTheme
      ),
    );
  }
}
