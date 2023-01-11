import 'package:flutter/material.dart';
import 'package:readr/storage/app_preferences.dart';

class UserProvider extends ChangeNotifier {
  final AppPreferences _preferences = AppPreferences();

  bool _isUserLoggedIn = false;

  bool get isUserLoggedIn => _isUserLoggedIn;

  bool _isUserOnboarded = false;

  bool get isUserOnboarded => _isUserOnboarded;

  void initialize() async {
    _isUserLoggedIn = await _preferences.getUserIsLoggedIn();
    _isUserOnboarded = await _preferences.getUserIsOnboard();
  }

  void setLoggedIn() async {
    _isUserLoggedIn = true;
    await _preferences.setUserLoggedIn(true);
    notifyListeners();
  }

  void completeOnboarding() async {
    _isUserOnboarded = true;
    await _preferences.setUserOnboarded(true);
    notifyListeners();
  }

  void logoutUser() async {
    _isUserOnboarded = false;
    _isUserLoggedIn = false;
    await _preferences.setUserLoggedIn(false);
    await _preferences.setUserOnboarded(false);
    notifyListeners();
  }
}
