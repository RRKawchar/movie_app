import 'package:movie_app_demo/src/core/utils/private_keys.dart';

class ApiEndpoints {
  static String get searchByCategory => "${baseUrl}3/search/movie";
  static String get popularMovie => "${baseUrl}3/movie/popular";
  static String get nowPlaying => "${baseUrl}3/movie/now_playing";
  static String get upcomingMovie => "${baseUrl}3/movie/upcoming";
  static String get topRated => "${baseUrl}3/movie/top_rated";
  static String get bestSeller => "${baseUrl}3/tv/airing_today";
  static String get moviesVideos => "${baseUrl}3/movie/{movie_id}/videos";
  static String get recommendedMovie =>"${baseUrl}3/movie/{movie_id}/recommendations";

  /// Authentication and Account
  static String get getRequestTokenApi =>"${baseUrl}3/authentication/token/new";
  static String get createSessionApi =>"${baseUrl}3/authentication/session/new";
  static String redirectToLogin({required String requestToken}) =>"${baseUrl}authenticate/$requestToken?redirect_to=myapp://auth";
  static String get getAccountId => "${baseUrl}3/account";
  static String get addToFavorite =>"${baseUrl}3/account/{account_id}/favorite";
  static String get getFavoriteMovie =>"${baseUrl}3/account/{account_id}/favorite/movies";
  static String get addToWatchList =>"${baseUrl}3/account/{account_id}/watchlist";
  static String get getWatchList =>"${baseUrl}3/account/{account_id}/watchlist/movies";

  /// Search Movie
  static String searchMovie = "${baseUrl}3/search/movie";
}
