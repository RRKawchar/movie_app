import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/core/helper/helper_method.dart';
import 'package:movie_app_demo/src/core/network/api_endpoints.dart';
import 'package:movie_app_demo/src/core/network/api_handler.dart';
import 'package:movie_app_demo/src/features/movie/model/movie_model.dart';


class CategoriesController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;
  RxInt selectedIndex=0.obs;
  RxList<MovieModel> movies = <MovieModel>[].obs;

  var movieList=["Action","Adventure","Animation","Comedy","Crime",
    "Documentary","Drama","Family","Fantasy","History","Horror","Music",
    "Mystery","Music","Romance","Science Fiction","TV Movie","Thriller","War","Western",];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: movieList.length, vsync: this);
    tabController.addListener(() {
     selectedIndex.value=tabController.index;
      getMovie(movieList[tabController.index]);
    });

    getMovie(movieList[0]);

  }

  @override
  void dispose() {
   tabController.dispose();
    super.dispose();
  }



  Future<void> getMovie(String query)async{
    try{

      var response=await ApiHandler.handleResponse(await ApiHandler.getRequest(apiUrl: ApiEndpoints.searchByMovie(query: query)));
      if(response !=null){
        movies.value=[];
        for(var result in response['results']){
          movies.add(MovieModel.fromJson(result));
        }

      }

    }catch(e){
      kPrint(e);
      throw e.toString();
    }
  }

}