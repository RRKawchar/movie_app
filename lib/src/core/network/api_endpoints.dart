import 'package:movie_app_demo/src/core/utils/private_keys.dart';
class ApiEndpoints{
  //static const String apiKey="bfba5dfc023d5a63122bc9a825f1ce68";
  //static const String _baseUrl="https://api.themoviedb.org/"
  static  String searchByCategory({required String query}) => "https://api.themoviedb.org/3/search/movie?query=$query&api_key=$apiKey&include_adult=false&language=en-US&page=1";
  static String get popularMovie=> "https://api.themoviedb.org/3/movie/popular?&api_key=$apiKey&language=en-US&page=1";
  static String get nowPlaying=> "https://api.themoviedb.org/3/movie/now_playing?&api_key=$apiKey&language=en-US&page=1";
  static String get upcomingMovie=> "https://api.themoviedb.org/3/movie/upcoming?&api_key=$apiKey&language=en-US&page=1";
  static String get topRated=> "https://api.themoviedb.org/3/movie/top_rated?&api_key=$apiKey&language=en-US&page=1";
  static String get bestSeller=> "https://api.themoviedb.org/3/tv/airing_today?&api_key=$apiKey&language=en-US&page=1";
  static String  moviesVideos({required int movieId})=> "https://api.themoviedb.org/3/movie/$movieId/videos?&api_key=$apiKey&language=en-US";
  static String  movieDetails({required int movieId})=> "https://api.themoviedb.org/3/movie/$movieId?&api_key=$apiKey&language=en-US";
  static String  recommendedMovie({required int movieId})=> "https://api.themoviedb.org/3/movie/$movieId/recommendations?&api_key=$apiKey&language=en-US&page=1";
 // static String  movieDetails({required int movieId})=> "https://api.themoviedb.org/3/movie/957452?language=en-US&api_key=$_apiKey";



/// TMDB Service Apis

  static String get getRequestTokenApi=> "https://api.themoviedb.org/3/authentication/token/new?api_key=$apiKey";
  static String get createSessionApi=> "https://api.themoviedb.org/3/authentication/session/new?api_key=$apiKey";
  static String redirectToLogin({required String requestToken})=> "https://www.themoviedb.org/authenticate/$requestToken?redirect_to=myapp://auth";
  static String getAccountId({required String sessionId}) => "https://api.themoviedb.org/3/account?&api_key=$apiKey&session_id=$sessionId";
  static String addToFavorite({required int accountId,required String sessionId}) => "https://api.themoviedb.org/3/account/$accountId/favorite?&api_key=$apiKey&session_id=$sessionId";
  static String getFavoriteMovie({required int accountId,required String sessionId,})=>"https://api.themoviedb.org/3/account/$accountId/favorite/movies?language=en-US&page=1&api_key=$apiKey&session_id=$sessionId&sort_by=created_at.asc";



}