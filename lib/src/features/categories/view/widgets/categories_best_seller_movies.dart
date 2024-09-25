import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/categories/controller/categories_controller.dart';

class CategoriesBestSellerMovie extends StatelessWidget {
  const CategoriesBestSellerMovie({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesController categoriesController = Get.put(CategoriesController());
    return SizedBox(
      height: context.height / 4,
      width: context.width,
      child: Obx(
            () {
          return CarouselSlider(
            items: categoriesController.bestSellerMovies
                .map(
                  (element) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: const EdgeInsets.all(0.2),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
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
            )
                .toList(),
            options: CarouselOptions(
              height: context.height / 4,
              aspectRatio: 16 / 9,
              viewportFraction: 0.4,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              scrollDirection: Axis.horizontal,
            ),
          );
          ;
        },
      ),
    );
  }
}
