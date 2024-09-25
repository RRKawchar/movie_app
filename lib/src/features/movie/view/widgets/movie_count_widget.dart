import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/features/movie/controller/movie_controller.dart';

class MovieCountWidget extends StatelessWidget {
  const MovieCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.put(MovieController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(color: kFillColor),
            child: Text(
              "${movieController.popularMovies.length}+",
              style: Theme.of(context).textTheme.titleSmall,
            ))),
        const SizedBox(
          width: 10,
        ),
        Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(color: kFillColor),
            child: Text(
              "Action",
              style: Theme.of(context).textTheme.titleSmall,
            )),
        const SizedBox(
          width: 10,
        ),
        Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(color: kFillColor),
            child: Text(
              "IMAX",
              style: Theme.of(context).textTheme.titleSmall,
            )),
      ],
    );
  }
}
