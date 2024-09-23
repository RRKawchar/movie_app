import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;

  var movieList=["Action","Adventure","Animation","Comedy","Crime",
    "Documentary","Drama","Family","Fantasy","History","Horror","Music",
    "Mystery","Music","Romance","Science Fiction","TV Movie","Thriller","War","Western",];

  @override
  void onInit() {
    super.onInit();
    tabController=TabController(length: movieList.length, vsync: this);
  }

  @override
  void dispose() {
   tabController.dispose();
    super.dispose();
  }



}