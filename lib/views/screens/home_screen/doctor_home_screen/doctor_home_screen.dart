import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/const/app_colors.dart';
import 'package:random_video_chat_app/const/app_images.dart';
import 'package:random_video_chat_app/controllers/doctor_home_controller.dart';
import 'package:random_video_chat_app/controllers/home_controller.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({Key? key}) : super(key: key);
  final doctorHomeController = Get.find<DoctorHomeController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Obx(
            ()=> Scaffold(
          body: doctorHomeController.pageList[doctorHomeController.getPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: doctorHomeController.getPageIndex,
            selectedItemColor:Colors.blue,
            backgroundColor: Colors.white,
            onTap: (int index)=>doctorHomeController.setPageIndex(index),
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
