import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/account/view/page/account_page.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/auth_page.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/login_page.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/register_page.dart';
import 'package:movie_app_demo/src/features/details/view/page/movie_details.dart';
import 'package:movie_app_demo/src/features/favorite/view/page/favorite_page.dart';
import 'package:movie_app_demo/src/features/home/view/page/home_page.dart';
import 'package:movie_app_demo/src/features/search/view/page/search_page.dart';
import 'package:movie_app_demo/src/features/splash/view/page/splash_page.dart';
import 'package:movie_app_demo/src/features/watchList/view/page/watchlist_page.dart';

class AppRoutes {
  static const String splashPage = "/";
  static const String authPage = "/auth-page";
  static const String homePage = "/home-page";
  static const String registerPage = "/register-page";
  static const String loginPage = "/login-page";
  static const String movieDetails = "/movie-details-page";
  static const String favoritePage = "/favorite-page";
  static const String accountPage = "/account-page";
  static const String watchList = "/watchlist-page";
  static const String searchPage = "/search-page";


  static List<GetPage> getPage() => [
        GetPage(
          name: AppRoutes.splashPage,
          page: () => const SplashPage(),
          transition: Transition.rightToLeft,
        ),
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
        GetPage(
          name: AppRoutes.accountPage,
          page: () => const AccountPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: AppRoutes.watchList,
          page: () => const WatchlistPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: AppRoutes.searchPage,
          page: () => const SearchPage(),
          transition: Transition.rightToLeft,
        ),
      ];
}
