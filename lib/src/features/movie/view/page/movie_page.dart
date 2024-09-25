import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/movie/controller/movie_controller.dart';
import 'package:movie_app_demo/src/features/movie/view/widgets/movie_count_widget.dart';
import 'package:movie_app_demo/src/features/movie/view/widgets/now_playing_widget.dart';
import 'package:movie_app_demo/src/features/movie/view/widgets/popular_movie_widget.dart';
import 'package:movie_app_demo/src/features/movie/view/widgets/upcoming_movies.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Popular Movies",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const PopularMovieWidget(),
            const SizedBox(height: 10),
            const MovieCountWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Now Playing",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const NowPlayingWidget(),
            const SizedBox(height: 10),
            const MovieCountWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "UpComing",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const UpcomingMovies(),
            const SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}
