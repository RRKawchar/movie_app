import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/core/utils/private_keys.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';

class MovieController extends GetxController {
  RxList<MovieModel> popularMovies = <MovieModel>[].obs;
  RxList<MovieModel> nowPlayings = <MovieModel>[].obs;
  RxList<MovieModel> upComingMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPopularMovie();
    fetchNowPlaying();
    fetchUpComingMovie();
  }

  Future<void> fetchPopularMovie() async {
    try {
      var response = await ApiHandler.handleResponse(
        await ApiHandler.getRequest(
          apiUrl: ApiEndpoints.popularMovie,
          queryParams: {
            "api_key": apiKey,
            "language": "en-US",
            "page": "1",
          },
        ),
      );
      if (response != null) {
        popularMovies.value = [];
        for (var result in response['results']) {
          popularMovies.add(MovieModel.fromJson(result));
        }
      }
    } catch (e) {
      kPrint(e);
      throw e.toString();
    }
  }

  Future<void> fetchNowPlaying() async {
    try {
      var response = await ApiHandler.handleResponse(
        await ApiHandler.getRequest(
          apiUrl: ApiEndpoints.nowPlaying,
          queryParams: {
            "api_key": apiKey,
            "language": "en-US",
            "page": "1",
          },
        ),
      );
      if (response != null) {
        nowPlayings.value = [];
        for (var result in response['results']) {
          nowPlayings.add(MovieModel.fromJson(result));
        }
      }
    } catch (e) {
      kPrint(e);
      throw e.toString();
    }
  }

  Future<void> fetchUpComingMovie() async {
    try {
      var response = await ApiHandler.handleResponse(
        await ApiHandler.getRequest(
          apiUrl: ApiEndpoints.upcomingMovie,
          queryParams: {
            "api_key": apiKey,
            "language": "en-US",
            "page": "1",
          },
        ),
      );
      if (response != null) {
        upComingMovies.value = [];
        for (var result in response['results']) {
          upComingMovies.add(MovieModel.fromJson(result));
        }
      }
    } catch (e) {
      kPrint(e);
      throw e.toString();
    }
  }
}
