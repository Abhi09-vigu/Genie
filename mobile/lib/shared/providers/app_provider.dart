import 'package:flutter/material.dart';

/// AppProvider manages global app settings like theme mode and global loading states.
class AppProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isGlobalLoading = false;
  String? _loadingMessage;

  ThemeMode get themeMode => _themeMode;
  bool get isGlobalLoading => _isGlobalLoading;
  String? get loadingMessage => _loadingMessage;

  /// Toggles between light and dark theme mode.
  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }

  /// Sets the global loading state and an optional message.
  void setGlobalLoading(bool loading, {String? message}) {
    if (_isGlobalLoading == loading && _loadingMessage == message) return;
    _isGlobalLoading = loading;
    _loadingMessage = message;
    notifyListeners();
  }
}
