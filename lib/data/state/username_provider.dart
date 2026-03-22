import 'package:flutter/material.dart';

import '../../data/persistence/preferences.dart';

/// Provides chosen username for state management. Updates UI when user makes changes.
class UsernameProvider extends ChangeNotifier {
  String username = "";

  /// Loades the selected theme color from storage.
  Future<void> loadUsername() async {
    username = await Preferences.loadUsername() ?? "";
  }

  /// Saves the selected theme color to storage and updates UI.
  void setUsername(String newUsername) {
    username = newUsername;
    notifyListeners();
    Preferences.saveUsername(newUsername);
  }
}
