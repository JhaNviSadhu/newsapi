import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class ThemeController extends GetxController {
  // final _box = GetStorage();
  final _key = 'isDarkMode';

  // Get the theme mode from local storage
  ThemeMode get theme {
    debugPrint("Get isDarkMode ${_loadTheme()}");
    return _loadTheme() ? ThemeMode.dark : ThemeMode.light;
  }

  bool _loadTheme() => getBoolAsync(_key, defaultValue: true);

  void saveTheme(bool isDarkMode) {
    setValue(_key, isDarkMode);
    debugPrint("isDarkMode ${getBoolAsync(_key)}");
  }

  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}
