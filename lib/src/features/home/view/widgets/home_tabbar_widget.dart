import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:movie_app_demo/src/core/utils/color.dart';

homeTabBarWidget({
  required BuildContext context,
  TabController? tabController,
  List<Widget>? tabs,
}) {
  return PreferredSize(
    preferredSize: Size(
      context.width,
      40,
    ),
    child: TabBar(
      controller: tabController,
      isScrollable: true,
      labelPadding: const EdgeInsets.symmetric(horizontal: 20),
      tabAlignment: TabAlignment.center,
      labelStyle: const TextStyle(
        fontSize: 20,
        color: kPrimaryColor,
      ),
      unselectedLabelColor: kTextColor,
      unselectedLabelStyle: const TextStyle(fontSize: 18),
      tabs: tabs!,
    ),
  );
}
