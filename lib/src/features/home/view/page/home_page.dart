import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/routes/app_routes.dart';
import 'package:movie_app_demo/src/features/categories/view/page/categories_page.dart';
import 'package:movie_app_demo/src/features/home/controller/home_controller.dart';
import 'package:movie_app_demo/src/features/home/view/widgets/home_tabbar_widget.dart';
import 'package:movie_app_demo/src/features/movie/view/page/movie_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinema", style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.accountPage);
            },
            icon: const Icon(
              Icons.person_outline_outlined,
              size: 35,
            ),
          )
        ],
        bottom: homeTabBarWidget(
          context: context,
          tabController: homeController.tabController,
          tabs: homeController.pageList
              .map((e) => Tab(
                  text: e,
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.search),
      ),
      body: TabBarView(
        controller: homeController.tabController,
        children: [
          MoviePage(),
          CategoriesPage(),

        ],
      ),
    );
  }
}



