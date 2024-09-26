import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/videos/controller/videos_controller.dart';
import 'package:movie_app_demo/src/features/videos/model/movie_video_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatelessWidget {
  final int movieId;
  final String movieKey;
  const VideoPlayerPage({super.key, required this.movieId, required this.movieKey,});

  @override
  Widget build(BuildContext context) {
    VideosController videosController = Get.put(VideosController(movieId: movieId));
    videosController.initializePlayer('https://www.youtube.com/watch?v=$movieKey');
    return Scaffold(
      body: Column(
        children: [
          videosController.controller != null &&
              videosController.controller!.initialVideoId ==
                  YoutubePlayer.convertUrlToId(
                      "https://www.youtube.com/watch?v=$movieKey")
              ? YoutubePlayer(
            controller: videosController.controller!,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
