import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/extensions/build_context_extensions.dart';
import 'package:movie_app_demo/src/core/utils/constants.dart';
import 'package:movie_app_demo/src/core/widgets/k_chached_network_image.dart';
import 'package:movie_app_demo/src/features/favorite/controller/favorite_controller.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/videos_player_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController=Get.find<FavoriteController>();
    return Scaffold(
      appBar: AppBar(
      title: Text("Likes"),
      ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10),
       child: Obx(()=>favoriteController.isLoading.value?Center(child: CircularProgressIndicator(),):GridView.builder(
         itemCount: favoriteController.favoriteList.length,
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               // childAspectRatio: 16/12,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
               mainAxisExtent: 220
           ),
           itemBuilder: (context,index){
           final favoriteMovie=favoriteController.favoriteList[index];
             return Column(
               children: [
                 // SizedBox(
                 //   height: 180,
                 //   width: context.screenWidth,
                 //   child: KCachedNetworkImage(imgUrl: "${AppConstants.apiImagePath}${favoriteMovie.backdropPath}"),
                 // ),
                 Text("data",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
               ],
             );
           }

       )),
     ),
    );
  }
}
