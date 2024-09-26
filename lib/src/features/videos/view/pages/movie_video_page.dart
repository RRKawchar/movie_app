import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/videos/controller/videos_controller.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/videos_player_page.dart';

class MovieVideoPage extends StatelessWidget {
  final int movieId;
  final String thumbnail;
  const MovieVideoPage({super.key, required this.movieId, required this.thumbnail,});

  @override
  Widget build(BuildContext context) {
    VideosController videosController = Get.put(VideosController(movieId: movieId));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Videos"),
      ),
      body: Obx(
            () {
          return ListView.builder(
            itemCount: videosController.videoList.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.red,
                          borderRadius: BorderRadius.circular(0)
                        ),
                        child: KCachedNetworkImage(
                          imgUrl: "${AppConstants.apiImagePath}$thumbnail",
                        ),
                      ),
                      InkWell(
                          onTap: (){
                            Get.to(VideoPlayerPage(movieId: movieId, movieKey: videosController.videoList[index].key.toString()));
                          },
                          child: Icon(Icons.play_circle,size: 80,))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(videosController.videoList[index].name.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Text(videosController.videoList[index].type.toString()),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
