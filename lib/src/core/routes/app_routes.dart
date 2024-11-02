import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/auth_page.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/login_page.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/register_page.dart';
import 'package:movie_app_demo/src/features/details/view/page/movie_details.dart';
import 'package:movie_app_demo/src/features/favorite/view/page/favorite_page.dart';
import 'package:movie_app_demo/src/features/home/view/page/home_page.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/movie_videos_list_page.dart';

class AppRoutes {
  static const String authPage = "/";
  static const String homePage = "/home-page";
  static const String registerPage = "/register-page";
  static const String loginPage = "/login-page";
  static const String movieDetails = "/movie-details-page";
  static const String favoritePage = "/favorite-page";
  //static const String moviesVideoPage = "/movie-video-page";

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
        GetPage(
          name: AppRoutes.movieDetails,
          page: () => MovieDetails(movieModel: Get.arguments),
          transition: Transition.rightToLeft,
        ),
        // GetPage(
        //   name: AppRoutes.moviesVideoPage,
        //   page: () => MovieVideoPage(movieId: Get.arguments,thumbnail:Get.arguments),
        //   transition: Transition.rightToLeft,
        // ),
    GetPage(
      name: AppRoutes.authPage,
      page: () => const AuthPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.favoritePage,
      page: () => const FavoritePage(),
      transition: Transition.rightToLeft,
    ),
      ];
}
