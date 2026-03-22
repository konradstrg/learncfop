import 'package:flutter/material.dart';

import '../../data/persistence/preferences.dart';

/// Provides theme color for state management. Updates UI when user makes changes.
class ThemeColorProvider extends ChangeNotifier {
  Color themeColor = Colors.green;

  /// Loades the selected theme color from storage.
  Future<void> loadThemeColor() async {
    if (await Preferences.loadThemeColor() != null) {
      themeColor = (await Preferences.loadThemeColor())!;
    }
  }

  /// Saves the selected theme color to storage and updates UI.
  void setThemeColor(Color newThemeColor) {
    themeColor = newThemeColor;
    notifyListeners();
    Preferences.saveThemeColor(newThemeColor);
  }
}
