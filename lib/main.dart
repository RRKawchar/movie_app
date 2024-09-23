import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/theme/app_theme.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            theme: darkTheme,
            themeMode: ThemeMode.dark,
            initialRoute: AppRoutes.homePage,
            getPages: AppRoutes.getPage(),
           // home: HomePage()

    );
  }
}
