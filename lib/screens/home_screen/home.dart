

import 'package:api_session/screens/entertainment_screen/entertainment.dart';
import 'package:api_session/screens/home_screen/controller/home_controller.dart';
import 'package:api_session/screens/news_screen/news_screen.dart';
import 'package:api_session/screens/science_screen_news/science_screen.dart';
import 'package:api_session/screens/sports_news_Screen/sports_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  List<Widget> screens = [
    NewsScreen(),
    Entertainment(),
    ScienceScreen(),
    SportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        currentIndex: homeController.currentIndex.value,
        onTap: (v){
          homeController.onTap(v);
        },
        items: const[
          BottomNavigationBarItem(
            backgroundColor: Colors.black26,
            icon: Icon(Icons.newspaper,),
            label: 'News'
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black26,
              icon: Icon(Icons.recent_actors_outlined),
              label: 'Entertain'
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black26,

              icon: Icon(Icons.science),
              label: 'Science'
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black26,

              icon: Icon(Icons.sports),
              label: 'Sports'
          ),
        ],

      )),
      body: Obx(() => screens[homeController.currentIndex.value]),

    );
  }
}
