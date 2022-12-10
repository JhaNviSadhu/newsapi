import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsapi/binding/binding.dart';
import 'package:newsapi/network/api_provider.dart';
import 'package:newsapi/screen/dashboard/dashboard.dart';

import 'package:newsapi/theme/themes.dart';
import 'package:newsapi/theme/themeservice.dart';

GetIt sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeController = Get.put(ThemeController());

  void setupServiceLocator() {
    if (!sl.isRegistered<APIProvider>()) {
      sl.registerLazySingleton<APIProvider>(() => APIProvider());
    }
  }

  @override
  Widget build(BuildContext context) {
    setupServiceLocator();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: NewsBindings(),
      title: 'Newsapp',
      themeMode: themeController.theme,
      darkTheme: Themes.darkTheme,
      theme: Themes.lightTheme,
      home: const Dashbord(),
    );
  }
}
