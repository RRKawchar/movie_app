import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/core/utils/private_keys.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';

class MovieSearchController extends GetxController {
  RxList<MovieModel> searchMovieList = <MovieModel>[].obs;
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();

  Future<void> searchMovie(String query) async {
    try {
      isLoading.value = true;
      Map<String, String> queryParams = {
        "query": query,
        "include_adult": "false",
        "language": "en-US",
        "page": "1",
        "api_key": apiKey
      };
      var response = await ApiHandler.handleResponse(
        await ApiHandler.getRequest(apiUrl: ApiEndpoints.searchMovie, queryParams: queryParams),
      );

      if (response != null) {
        searchMovieList.value = [];

        for (var movie in response['results']) {
          searchMovieList.add(MovieModel.fromJson(movie));
        }
      } else {
        return response;
      }
    } catch (e) {
      kPrint("Error while search movie : $e");
      throw "Error while search movie : $e";
    } finally {
      isLoading.value = false;
    }
  }
}
