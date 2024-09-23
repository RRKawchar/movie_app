import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{


  late TabController tabController;
  var pageList = ["All Movies", "Series",];



  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: pageList.length, vsync: this);
  }


  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }



}