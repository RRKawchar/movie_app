import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/features/categories/controller/categories_controller.dart';

class CategoriesTabWidget extends StatelessWidget {
  const CategoriesTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesController categoriesController = Get.put(CategoriesController());
    return Obx(
          () => TabBar(
        controller: categoriesController.tabController,
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        tabAlignment: TabAlignment.center,
        labelStyle: const TextStyle(
          fontSize: 16,
          color: kSecondaryColor,
        ),
        unselectedLabelColor: kTextColor,
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        tabs:
        List.generate(categoriesController.movieList.length, (index) {
          bool isSelected =
              categoriesController.selectedIndex.value == index;
          return Tab(
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: isSelected
                    ? kSecondaryColor
                    : kFillColor.withOpacity(0.2),
              ),
              child: Text(
                categoriesController.movieList[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : kTextColor,
                  fontSize: 15,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
