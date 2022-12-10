import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapi/utils/colors.dart';

class Themes {
  static bool get isDarkTheme =>
      Get.mediaQuery.platformBrightness == Brightness.dark;

  static Color get appBarColor {
    return Get.isDarkMode ? appBarDarkColor : appBarLightColor;
  }

  static Color get textReverseColor =>
      Get.isDarkMode ? Colors.white : Colors.black;

  static Color get tabColor => Get.isDarkMode ? Colors.black : Colors.white;

  static Color get bgColor => Get.isDarkMode ? bgDarkColor : bgLightColor;

  static Color get containerColor =>
      Get.isDarkMode ? containerBgDarkColor : containerBgLightColor;

  static final lightTheme = ThemeData(
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: appBarLightColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    scaffoldBackgroundColor: bgLightColor,
    primaryColor: primarycolor,
    primarySwatch: Colors.orange,
    primaryColorBrightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
  );

  static final darkTheme = ThemeData(
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    appBarTheme: const AppBarTheme(color: appBarDarkColor, centerTitle: true),
    scaffoldBackgroundColor: bgDarkColor,
    primaryColor: primarycolor,
    primarySwatch: Colors.orange,
    primaryColorBrightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
  );
}
