import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/utils/utils.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  bool isUserRegister() {
    return sharedPreferences.getBool(AppKeys.isUserRegister) ?? false;
  }

  void setUserRegister({required bool isUserRegister}) {
    sharedPreferences.setBool(AppKeys.isUserRegister, isUserRegister);
  }
}
