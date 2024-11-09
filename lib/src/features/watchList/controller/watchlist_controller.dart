import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/core/utils/private_keys.dart';
import 'package:movie_app_demo/src/features/account/controller/account_controller.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';

class WatchListController extends GetxController {
  AccountController accountController = Get.find<AccountController>();
  RxList<MovieModel> watchList = <MovieModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWatchList();
  }

  Future<void> addToWatchList(int movieId) async {
    try {
      isLoading.value = true;
      Map<String, dynamic> body = {
        "media_type": "movie",
        "media_id": movieId,
        "watchlist": true
      };

      final accountId = accountController.accountList.value.id;
      final sessionId = accountController.sessionId.value;

      if (accountId == null || sessionId == null) {
        kPrint("Error: accountId or sessionId is null");
        return;
      } else {
        if (isWatchlistAdded(movieId)) {
          Fluttertoast.showToast(
            msg: "Already added to watchlist",
            backgroundColor: kSecondaryColor,
          );
        } else {
          //  //?&api_key=$apiKey&session_id=$sessionId
          var response = await ApiHandler.handleResponse(
            await ApiHandler.postRequest(
              apiUrl: ApiEndpoints.addToWatchList,
              pathParams: {
                "account_id":accountId,
              },
              queryParams: {
                "api_key":apiKey,
                "session_id":sessionId.toString()
              },

              body: jsonEncode(body),
            ),
          );

          if (response['success'] == true) {
            Fluttertoast.showToast(
              msg: "Added to watchlist!",
              backgroundColor: kSuccessColor,
            );
            await fetchWatchList();
          } else {
            Fluttertoast.showToast(
              msg: "Failed to add watchlist!..",
              backgroundColor: kSecondaryColor,
            );
          }
        }
      }
    } catch (e) {
      kPrint("Error while adding to watchlist : $e");
      throw "Error while adding to watchlist : $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchWatchList() async {
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
          apiUrl: ApiEndpoints.getWatchList,
          pathParams: {
            "account_id":accountId
          },
          queryParams: {
            "api_key":apiKey,
            "session_id":sessionId.toString(),
            "language":"en-US",
            "page":"1",
            "sort_by":"created_at.asc"
          }
        ),
      );

      if (response['results'] != null) {
        watchList.value = [];
        for (var movie in response['results']) {
          watchList.add(MovieModel.fromJson(movie));
        }
        kPrint("My Watchlist Movie $watchList");
      } else {
        kPrint("No Watchlist movies found.");
      }
    } catch (e) {
      kPrint("Error while fetching watchlist movie : $e");
      throw "Error while fetching watchlist movie : $e";
    } finally {
      isLoading.value = false;
    }
  }

  bool isWatchlistAdded(int movieId) {
    return watchList.any((movie) => movie.id == movieId);
  }
}
