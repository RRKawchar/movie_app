import 'package:flutter/material.dart';
import 'package:movie_app_demo/src/core/widgets/k_button.dart';
import 'package:movie_app_demo/src/features/videos/controller/videos_controller.dart';

class PlayDownloadButtons extends StatelessWidget {
  final VideosController videosController;
  final String movieKey;
  const PlayDownloadButtons({
    super.key,
    required this.videosController,
    required this.movieKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: KButton(
              onTap: () {
               videosController.controller!.load(movieKey);
               //  videosController.isPlayerReady.value=true;
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow_outlined,
                  ),
                  Text("Play")
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: KButton(
              onTap: () {},
              bgColor: Colors.white12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_download_outlined),
                  Text("Download")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
