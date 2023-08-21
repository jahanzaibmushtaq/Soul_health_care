import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/models/hospital_model/hospital_model.dart';
import 'package:random_video_chat_app/models/lab_model/lab_model.dart';

import 'package:random_video_chat_app/utils/app_imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkUser() async {
    String data = (await LocalStorageService.localStorageInstance.getUserData());
    AuthServices.authInstance.getUser();
    if (AuthServices.authInstance.user != null) {
      if (data.isEmpty) {
        var userData = await DatabaseService.databaseService
            .getUserData(AuthServices.authInstance.user!.uid);
        if (!userData.exists) {
          Get.toNamed(AppScreen.userCategoryPage);
        } else {
          LocalStorageService.localStorageInstance
              .setUserData(UserModel.fromJson(userData.data()!));
          Get.toNamed(AppScreen.homeScreen);
        }
      }
      else {
        Get.toNamed(AppScreen.homeScreen);
      }
    } else {
      Get.toNamed(AppScreen.signInScreen);
    }
  }



  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      checkUser();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppImages.appLogo,
              height: 310.h,
              width: 320.w,
            ),
            Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
