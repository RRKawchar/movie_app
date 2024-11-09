import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/features/favorite/controller/favorite_controller.dart';
import 'package:movie_app_demo/src/features/videos/controller/videos_controller.dart';
import 'package:movie_app_demo/src/features/videos/model/movie_video_model.dart';
import 'package:movie_app_demo/src/features/videos/view/widgets/play_download_buttons.dart';
import 'package:movie_app_demo/src/features/videos/view/widgets/recommended_movie.dart';
import 'package:movie_app_demo/src/features/videos/view/widgets/watchlist_like_share_widget.dart';
import 'package:movie_app_demo/src/features/watchList/controller/watchlist_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatelessWidget {
  final int movieId;
  final MovieVideosModel movieVideosList;
  final String movieKey;
  final String overView;
  const VideoPlayerPage({
    super.key,
    required this.movieId,
    required this.movieKey,
    required this.movieVideosList,
    required this.overView,
  });

  @override
  Widget build(BuildContext context) {
    VideosController videosController =
        Get.put(VideosController(movieId: movieId));
    final favoriteController = Get.put(FavoriteController());
    final watchListController = Get.find<WatchListController>();
    videosController
        .initializePlayer('https://www.youtube.com/watch?v=$movieKey');
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        topActions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          )
        ],
        controller: videosController.controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {
          videosController.isPlayerReady.value = true;
        },
      ),
      builder: (context, player) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: ListView(
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Movie Title
                          _buildTitle(),

                          /// Subtitle
                          _buildSubTitleWidget(),
                          SizedBox(height: 10),
                          Text(
                            overView,
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PlayDownloadButtons(
                      videosController: videosController,
                      movieKey: movieKey,
                    ),
                    SizedBox(height: 10),
                    WatchlistLikeShareWidget(
                      favoriteController: favoriteController,
                      watchListController: watchListController,
                      movieId: movieId,
                      movieKey: movieKey,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    RecommendedMovie(movieId: movieId)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "${movieVideosList.name ?? ""}-${movieVideosList.type ?? ""}",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  Widget _buildSubTitleWidget() {
    return Row(
      children: [
        Row(
          children: [
            Text(movieVideosList.iso6391 ?? ""),
            Text("/${movieVideosList.iso31661 ?? ""}"),
          ],
        ),
        Icon(
          Icons.horizontal_rule_rounded,
          size: 14,
        ),
        Row(
          children: [
            Text(movieVideosList.official == true ? "Official" : "Unofficial"),
            Icon(
              Icons.stop,
              size: 12,
            ),
            Text(movieVideosList.type ?? ""),
          ],
        ),
        Icon(
          Icons.horizontal_rule_rounded,
          size: 14,
        ),
        Text(dateFormatted(movieVideosList.publishedAt ?? "")),
      ],
    );
  }
}
