import 'package:flutter/material.dart';

import '../../data/persistence/preferences.dart';

/// Provides theme font for state management. Updates UI when user makes changes.
class FontProvider extends ChangeNotifier {
  String font = "Standard";

  /// Loades the selected theme color from storage.
  Future<void> loadFont() async {
    if (await Preferences.loadFont() != null) {
      font = (await Preferences.loadFont())!;
    }
  }

  /// Saves the selected font to storage and updates UI.
  void setFont(String newFont) {
    font = newFont;
    notifyListeners();
    Preferences.saveFont(newFont);
  }
}
