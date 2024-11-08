import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/extensions/build_context_extensions.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';

class FavoriteItemCard extends StatelessWidget {
  final MovieModel favoriteMovie;
  const FavoriteItemCard({super.key, required this.favoriteMovie});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(
              AppRoutes.movieDetails,
              arguments: favoriteMovie,
            );
          },
          child: SizedBox(
            height: 220,
            width: context.screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: KCachedNetworkImage(
                imgUrl:
                "${AppConstants.apiImagePath}${favoriteMovie.backdropPath}",
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          favoriteMovie.title ?? "",
          maxLines: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
