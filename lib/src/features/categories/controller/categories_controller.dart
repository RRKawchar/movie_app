import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/core/utils/private_keys.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';

class CategoriesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  RxInt selectedIndex = 0.obs;
  RxList<MovieModel> movies = <MovieModel>[].obs;
  RxList<MovieModel> topRatedMovies = <MovieModel>[].obs;
  RxList<MovieModel> bestSellerMovies = <MovieModel>[].obs;
  RxBool isMovieListLoading=false.obs;

  var movieList = [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "History",
    "Horror",
    "Music",
    "Mystery",
    "Music",
    "Romance",
    "Science Fiction",
    "TV Movie",
    "Thriller",
    "War",
    "Western",
  ];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: movieList.length, vsync: this);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
      fetchCategoryMovie(movieList[tabController.index]);
    });

    fetchCategoryMovie(movieList[0]);
    fetchTopRatedMovie();
    fetchBestSellerMovies();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  Future<void> fetchCategoryMovie(String query) async {
    try {
      var response = await ApiHandler.handleResponse(
        await ApiHandler.getRequest(
          apiUrl: ApiEndpoints.searchByCategory,
          queryParams: {
            "query": query,
            "api_key": apiKey,
            "include_adult": "false",
            "language": "en-US",
            "page": "1",
          },
        ),
      );
      if (response != null) {
        movies.value = [];
        for (var result in response['results']) {
          movies.add(MovieModel.fromJson(result));
        }
      }
    } catch (e) {
      kPrint(e);
      throw e.toString();
    }
  }

  Future<void> fetchTopRatedMovie() async {
    try {
      var response =
          await ApiHandler.handleResponse(await ApiHandler.getRequest(
        apiUrl: ApiEndpoints.topRated,
        queryParams: {
          "api_key": apiKey,
          "language": "en-US",
          "page": "1",
        },
      ));
      if (response != null) {
        topRatedMovies.value = [];
        for (var result in response['results']) {
          topRatedMovies.add(MovieModel.fromJson(result));
        }
      }
    } catch (e) {
      kPrint(e);
      throw e.toString();
    }
  }

  Future<void> fetchBestSellerMovies() async {
    try {
      var response = await ApiHandler.handleResponse(
        await ApiHandler.getRequest(
          apiUrl: ApiEndpoints.bestSeller,
          queryParams: {
            "api_key": apiKey,
            "language": "en-US",
            "page": "1",
          },
        ),
      );
      if (response != null) {
        bestSellerMovies.value = [];
        for (var result in response['results']) {
          bestSellerMovies.add(MovieModel.fromJson(result));
        }
      }
    } catch (e) {
      kPrint(e);
      throw e.toString();
    }
  }
}
