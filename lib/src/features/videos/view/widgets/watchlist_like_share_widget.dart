import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/features/favorite/controller/favorite_controller.dart';
import 'package:movie_app_demo/src/features/watchList/controller/watchlist_controller.dart';
import 'package:share_plus/share_plus.dart';

class WatchlistLikeShareWidget extends StatelessWidget {
  final FavoriteController favoriteController;
  final WatchListController watchListController;
  final int movieId;
  final String movieKey;
  const WatchlistLikeShareWidget({
    super.key,
    required this.favoriteController,
    required this.watchListController,
    required this.movieId,
    required this.movieKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                watchListController.addToWatchList(movieId);
              },
              child: Obx(
                () => watchListController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Icon(
                        watchListController.isWatchlistAdded(movieId)
                            ? Icons.done
                            : Icons.add,
                      ),
              ),
            ),
            Text("Watchlist"),
          ],
        ),
        Column(
          children: [
            InkWell(
                onTap: () {
                  favoriteController.addToFavorite(movieId: movieId);
                },
                child: Obx(
                  () => Icon(
                    favoriteController.isFavorite(movieId)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: kFavoriteColor,
                  ),
                )),
            Obx(
              () => Text(
                  favoriteController.isFavorite(movieId) ? "Liked" : "Like"),
            )
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () async {
                await Share.share(
                    'Watch the movie https://www.youtube.com/watch?v=$movieKey');
              },
              child: Icon(
                Icons.mobile_screen_share,
              ),
            ),
            Text("Share")
          ],
        ),
      ],
    );
  }
}
