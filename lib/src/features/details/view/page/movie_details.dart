import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_demo/src/core/extensions/build_context_extensions.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_button.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/details/view/widgets/rating_widgets.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';
import 'package:movie_app_demo/src/features/videos/controller/videos_controller.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/movie_video_page.dart';

class MovieDetails extends StatelessWidget {
  final MovieModel movieDetails;
  const MovieDetails({
    super.key,
    required this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    VideosController videosController =
        Get.put(VideosController(movieId: movieDetails.id!));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person_outline_outlined,
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: context.height / 2,
                  child: KCachedNetworkImage(
                    imgUrl:
                        "${AppConstants.apiImagePath}${movieDetails.backdropPath}",
                  ),
                ),
                Positioned(
                    child: InkWell(
                  onTap: () {
                    Get.to(MovieVideoPage(
                        movieId: movieDetails.id!,
                        thumbnail: movieDetails.backdropPath!));
                  },
                  child: Icon(
                    Icons.play_circle,
                    size: 60,
                  ),
                )),
                Positioned(
                  bottom: 0,
                  child: Text(
                    movieDetails.originalTitle ?? "No Title",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formattedDate(movieDetails.releaseDate.toString()),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 3),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: kTextColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    "Action-Adventure",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const RatingWidgets(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      movieDetails.overview ?? "",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: kTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: KButton(
                onTap: () {},
                text: "book Tickets",
              ),
            )
          ],
        ),
      ),
    );
  }
}
