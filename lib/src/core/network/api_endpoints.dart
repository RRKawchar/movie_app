class ApiEndpoints{
  static const String _apiKey="bfba5dfc023d5a63122bc9a825f1ce68";
  static  String searchByCategory({required String query}) => "https://api.themoviedb.org/3/search/movie?query=$query&api_key=$_apiKey&include_adult=false&language=en-US&page=1";
  static String get popularMovie=> "https://api.themoviedb.org/3/movie/popular?&api_key=$_apiKey&language=en-US&page=1";
  static String get nowPlaying=> "https://api.themoviedb.org/3/movie/now_playing?&api_key=$_apiKey&language=en-US&page=1";
  static String get upcomingMovie=> "https://api.themoviedb.org/3/movie/upcoming?&api_key=$_apiKey&language=en-US&page=1";
  static String get topRated=> "https://api.themoviedb.org/3/movie/top_rated?&api_key=$_apiKey&language=en-US&page=1";
  static String get bestSeller=> "https://api.themoviedb.org/3/tv/airing_today?&api_key=$_apiKey&language=en-US&page=1";





}