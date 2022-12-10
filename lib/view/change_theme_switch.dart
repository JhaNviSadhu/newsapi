import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

import '../theme/themeservice.dart';
import '../utils/colors.dart';

class ChangeThemeButtonWidget extends StatefulWidget {
  ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  State<ChangeThemeButtonWidget> createState() =>
      _ChangeThemeButtonWidgetState();
}

class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: Get.isDarkMode,
      activeColor: primarycolor,
      onChanged: (value) {
        Get.changeTheme(ThemeData.light());

        if (Get.isDarkMode) {
          themeController.changeThemeMode((ThemeMode.light));
          themeController.saveTheme(false);
        } else {
          themeController.changeThemeMode((ThemeMode.dark));
          themeController.saveTheme(true);
        }
        Future.delayed(const Duration(milliseconds: 150), () {
          // Phoenix.rebirth(context);
          setState(() {});
        });
      },
    );
  }
}
