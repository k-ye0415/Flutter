import 'package:quiver/time.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreference {
  AppSharedPreference._(); // private 생성자로 밖에서는 생성할 수 없음.
  static AppSharedPreference instance = AppSharedPreference._();

  static init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  static const keyCount = "keyCount";

  late SharedPreferences _preferences;

  static void setCount(int count) {
    instance._preferences.setInt(keyCount, count);
  }

  static int getCount() {
    return instance._preferences.getInt(keyCount) ?? 0;
  }
}
