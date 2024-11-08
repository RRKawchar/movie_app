import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/watchList/controller/watchlist_controller.dart';
import 'package:movie_app_demo/src/features/watchList/view/widgets/watchlist_item_card.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final watchListController = Get.find<WatchListController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Watchlist"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => watchListController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  itemCount: watchListController.watchList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 280,
                  ),
                  itemBuilder: (context, index) {
                    final watchList = watchListController.watchList[index];
                    return WatchlistItemCard(watchList: watchList);
                  },
                ),
        ),
      ),
    );
  }
}
