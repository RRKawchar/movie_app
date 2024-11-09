import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/core/utils/private_keys.dart';
import 'package:movie_app_demo/src/features/account/controller/account_controller.dart';
import 'package:movie_app_demo/src/features/auth/view/pages/auth_page.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';

class FavoriteController extends GetxController {
  AccountController accountController = Get.find<AccountController>();
  RxList<MovieModel> favoriteList = <MovieModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavoriteMovie();
  }

  Future<void> fetchFavoriteMovie() async {
    try {
      isLoading.value = true;

      final accountId = accountController.accountList.value.id;
      final sessionId = accountController.sessionId.value;

      if (sessionId == null || accountId == null) {
        kPrint("Error: accountId or sessionId is null");
        return;
      }

      var response = await ApiHandler.handleResponse(
        await ApiHandler.getRequest(
          apiUrl: ApiEndpoints.getFavoriteMovie,
          pathParams: {
            "account_id":accountId.toInt(),
          },
          queryParams: {
            "language": "en-US",
            "page": "1",
            "api_key": apiKey,
            "session_id": sessionId.toString(),
            "sort_by": "created_at.asc",
          },
        ),
      );

      if (response['results'] != null) {
        favoriteList.value = [];
        for (var movie in response['results']) {
          favoriteList.add(MovieModel.fromJson(movie));
        }
        kPrint("My favorite Movie $favoriteList");
      } else {
        kPrint("No favorite movies found.");
      }
    } catch (e) {
      kPrint("Error while fetching favorite movies: $e");
      throw "Error while fetching favorite movies: $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addToFavorite({required int movieId}) async {
    try {
      isLoading.value = true;
      Map<String, dynamic> body = {
        "media_type": "movie",
        "media_id": movieId,
        "favorite": true
      };

      if (accountController.sessionId.value == "" ||
          accountController.accountList.value.id == null) {
        Fluttertoast.showToast(
          msg: "You are not logged in, please login first!",
          backgroundColor: kSecondaryColor,
        );
        Get.to(() => AuthPage());
      } else {
        if (isFavorite(movieId)) {
          Fluttertoast.showToast(
            msg: "All Ready Added to Favorite",
            backgroundColor: kSecondaryColor,
          );
        } else {
          var response = await ApiHandler.handleResponse(
            await ApiHandler.postRequest(
              apiUrl: ApiEndpoints.addToFavorite,
              body: jsonEncode(body),
              pathParams: {
                "account_id":accountController.accountList.value.id,
              },
              queryParams: {
                "api_key": apiKey,
                "session_id": accountController.sessionId.value.toString(),
              },
            ),
          );

          if (response['success'] == true) {
            Fluttertoast.showToast(
              msg: "Added to favorite!",
              backgroundColor: kSuccessColor,
            );
            await fetchFavoriteMovie();
          } else {
            Fluttertoast.showToast(
              msg: "Failed to add favorite",
              backgroundColor: kSecondaryColor,
            );
          }
        }
      }
    } catch (e) {
      kPrint("Error while add to favorite $e");
      throw "Error while add to favorite $e";
    } finally {
      isLoading.value = false;
    }
  }

  bool isFavorite(int movieId) {
    return favoriteList.any((movie) => movie.id == movieId);
  }
}
