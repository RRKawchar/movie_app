import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/movie/controller/movie_controller.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    return SizedBox(
      height: context.height / 3,
      width: context.width,
      child: Obx(
        () {
          return CarouselSlider(
            items: movieController.nowPlayings
                .map(
                  (element) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.movieDetails,
                          arguments: element,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(0.2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: KCachedNetworkImage(
                            imgUrl:
                                '${AppConstants.apiImagePath}${element.posterPath}',
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 300,
              aspectRatio: 16 / 9,
              viewportFraction: 0.5,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              //enlargeCenterPage: true,
              // enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          );
        },
      ),
    );
  }
}
