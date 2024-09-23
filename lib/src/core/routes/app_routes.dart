import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/login_page.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/register_page.dart';
import 'package:movie_app_demo/src/features/home/view/page/home_page.dart';

class AppRoutes {
  static const String homePage = "/";
  static const String registerPage = "/register-page";
  static const String loginPage = "/login-page";

  static List<GetPage> getPage() => [
        GetPage(
          name: AppRoutes.homePage,
          page: () => const HomePage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: AppRoutes.registerPage,
          page: () => const RegisterPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: AppRoutes.loginPage,
          page: () => const LoginPage(),
          transition: Transition.rightToLeft,
        ),
      ];
}
