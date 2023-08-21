import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/models/user_model/user_model.dart';
import 'package:random_video_chat_app/services/local_storage_services.dart';

class DashboardController extends GetxController {
  final userModel = UserModel().obs;

  void onGetData() async {
    final userModel = await LocalStorageService.localStorageInstance.getUserData();
    if (userModel != null) {
      userModel;
    }
  }


  @override
  void onInit() {
   onGetData();
    // TODO: implement onInit
    super.onInit();
  }
}
