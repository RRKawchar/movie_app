import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/videos/controller/videos_controller.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/videos_player_page.dart';

class MovieVideoPage extends StatelessWidget {
  final int movieId;
  final String thumbnail;
  const MovieVideoPage({
    super.key,
    required this.movieId,
    required this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    VideosController videosController =
        Get.put(VideosController(movieId: movieId));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Videos"),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: videosController.videoList.length,
            itemBuilder: (context, index) {
              return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildThumbnailWidget( videosController
                            .videoList[index].key
                            .toString()),
                        // Container(
                        //   height: 180,
                        //   width: Get.width,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(5),
                        //   ),
                        //   child: Stack(
                        //     clipBehavior: Clip.none,
                        //     alignment: Alignment.center,
                        //     children: [
                        //       KCachedNetworkImage(
                        //         imgUrl:
                        //             "${AppConstants.apiImagePath}$thumbnail",
                        //         colorFilter: Colors.black54,
                        //       ),
                        //       Positioned(
                        //           child: InkWell(
                        //               onTap: () {
                        //                 Get.to(VideoPlayerPage(
                        //                     movieId: movieId,
                        //                     movieKey: videosController
                        //                         .videoList[index].key
                        //                         .toString()));
                        //               },
                        //               child: Icon(
                        //                 Icons.play_circle,
                        //                 size: 80,
                        //                 color: Colors.blue,
                        //               )))
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 10),
                        Text(
                          videosController.videoList[index].name ?? "",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(videosController.videoList[index].official ==
                                    true
                                ? "Official"
                                : "Unofficial"),
                            SizedBox(width: 5),
                            Text(
                              videosController.videoList[index].type ?? '',
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Published At:",
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            Text(dateTimeFormatted(videosController
                                .videoList[index].publishedAt
                                .toString())),
                          ],
                        ),
                      ],
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
  Widget _buildThumbnailWidget(String movieKey){
    return Container(
      height: 180,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          KCachedNetworkImage(
            imgUrl:
            "${AppConstants.apiImagePath}$thumbnail",
            colorFilter: Colors.black54,
          ),
          Positioned(
              child: InkWell(
                  onTap: () {
                    Get.to(VideoPlayerPage(
                        movieId: movieId,
                        movieKey:movieKey));
                  },
                  child: Icon(
                    Icons.play_circle,
                    size: 80,
                    color: Colors.blue,
                  )))
        ],
      ),
    );
  }
}
