import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/home/view/widgets/home_tabbar_widget.dart';
import 'package:movie_app_demo/src/features/movie/controller/movie_controller.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController=Get.put(MovieController());
    return Scaffold(
      appBar: AppBar(
        bottom: homeTabBarWidget(context: context,
        tabController: movieController.tabController,
          tabs: movieController.movieList.map((e) => Tab(
            text: e,
          )).toList()
        ),
      ),
      body: Center(
        child: Text("Movie"),
      ),
    );
  }
}
