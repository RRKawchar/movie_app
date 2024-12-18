import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/account/controller/account_controller.dart';
import 'package:movie_app_demo/src/features/favorite/controller/favorite_controller.dart';
import 'package:movie_app_demo/src/features/search/controller/search_controller.dart';
import 'package:movie_app_demo/src/features/splash/controller/splash_controller.dart';
import 'package:movie_app_demo/src/features/watchList/controller/watchlist_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => AccountController(), fenix: true);
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => WatchListController(), fenix: true);
    Get.lazyPut(() => MovieSearchController(), fenix: true);

  }
  
  
}