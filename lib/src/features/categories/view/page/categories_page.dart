import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/features/categories/controller/categories_controller.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesController movieController = Get.put(CategoriesController());


    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(context.width, 0),
          child: Obx(
            () => TabBar(
              controller: movieController.tabController,
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 5),
              tabAlignment: TabAlignment.center,
              labelStyle: const TextStyle(
                fontSize: 16,
                color: kSecondaryColor,
              ),
              unselectedLabelColor: kTextColor,
              unselectedLabelStyle: const TextStyle(fontSize: 14),
              tabs: List.generate(movieController.movieList.length, (index) {
                bool isSelected = movieController.selectedIndex.value == index;
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
                      movieController.movieList[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : kTextColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: context.width,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: movieController.tabController,
                children: movieController.movieList.map((e) {
                  return Obx(() {
                    return CarouselSlider(

                        items: movieController.movies.map((element) =>

                                Container(
                                  padding: const EdgeInsets.all(1),

                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${AppConstants.apiImagePath}${element.posterPath}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ).toList(),
                        options: CarouselOptions(
                          height: 300,
                          aspectRatio: 16/9,
                          viewportFraction: 0.5,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          //onPageChanged: (va){},
                          scrollDirection: Axis.horizontal,
                        )
                    );



                  });
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 400,
              width: context.width,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

}
