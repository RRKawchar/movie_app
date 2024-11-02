import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/videos/controller/videos_controller.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/movie_videos_list_page.dart';

class RecommendedMovie extends StatelessWidget {
  final int movieId;
  const RecommendedMovie({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    VideosController videosController =
        Get.put(VideosController(movieId: movieId));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recommended Movies",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: Obx(
            () => ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: videosController.recommendedList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movieData = videosController.recommendedList[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.off(
                          () => MovieVideosListPage(
                            movieId: movieId,
                            thumbnail: movieData.posterPath ?? "",
                            overView:
                                movieData.overview ?? "Overview not founded",
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 190,
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: KCachedNetworkImage(
                            imgUrl:
                                "${AppConstants.apiImagePath}${movieData.backdropPath}",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 140,
                      child: Text(
                        movieData.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
