import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_demo/src/features/videos/view/pages/test_screen.dart';

class TestOnePage extends StatelessWidget {
  const TestOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(


        children: [

          Text("I am Riyal Roman Wchar djkfdh kSoftware Engineer"),
          ElevatedButton(onPressed: (){
            Get.to(()=>MyHomePage());

          }, child: Icon(Icons.next_plan)),
        ],
      ),),
    );
  }
}
