import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/categories/controller/categories_controller.dart';
import 'package:movie_app_demo/src/features/categories/view/widgets/categories_best_seller_movies.dart';
import 'package:movie_app_demo/src/features/categories/view/widgets/categories_tabs_widget.dart';
import 'package:movie_app_demo/src/features/categories/view/widgets/categories_top_rated_widget.dart';
import 'package:movie_app_demo/src/features/categories/view/widgets/tabbar_view_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesController categoriesController = Get.put(CategoriesController());

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(context.width, 0),
          child: const CategoriesTabWidget(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Watch Today",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const TabBarViewWidget(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Top Rated",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const CategoriesTopRatedWidget(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Best Seller",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const CategoriesBestSellerMovie(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
