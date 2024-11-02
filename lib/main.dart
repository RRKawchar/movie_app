import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/di/app_binding.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/theme/app_theme.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/auth_page.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/test_one_page.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/test_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );

  /// Set preferred orientations to portrait.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
            initialBinding: AppBindings(),
            initialRoute: AppRoutes.authPage,
            getPages: AppRoutes.getPage(),
            // home: TestOnePage()

    );
  }
}
