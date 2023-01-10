import 'package:shared_preferences/shared_preferences.dart';

const String _kLoggedInPrefKey = "loggedIn";
const String _kOnboardedPrefKey = "onboarded";
class AppPreferences {

  Future<SharedPreferences> getSharedPref() {
    return SharedPreferences.getInstance();
  }

  Future<void> setUserLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kLoggedInPrefKey, isLoggedIn);
  }

  Future<void> setUserOnboarded(bool isOnboarded) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kOnboardedPrefKey, isOnboarded);
  }

  Future<bool> getUserIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kLoggedInPrefKey) ?? false;
  }

  Future<bool> getUserIsOnboard() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kOnboardedPrefKey) ?? false;
  }
}