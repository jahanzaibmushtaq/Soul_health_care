import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/views/widgets/custom_loader.dart';

class LoadingDialog{
  static showLoading() {
    Get.dialog(
        const Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: CustomLoader(),
            )),
        barrierDismissible: false,
        barrierColor: Colors.black12);
  }

  static hideLoading() {
    Get.back();
  }
}