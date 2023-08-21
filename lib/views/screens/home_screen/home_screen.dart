import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/const/app_colors.dart';
import 'package:random_video_chat_app/const/app_images.dart';
import 'package:random_video_chat_app/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
    final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Obx(
        ()=> Scaffold(
          body: homeController.pageList[homeController.getPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeController.getPageIndex,
            selectedItemColor:Colors.blue,
            backgroundColor: Colors.white,
            onTap: (int index)=>homeController.setPageIndex(index),
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppImages.dashboardIcon)),label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AppImages.profileIcon)),label: "")
            ],
          ),
        ),
      ),
    );
  }
}
