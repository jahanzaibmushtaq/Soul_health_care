import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/services/firebase_storage_services.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:random_video_chat_app/views/dialogs/loading_dialogs.dart';
import 'package:random_video_chat_app/views/screens/user_profile/widget/gender_button_widget.dart';

class DoctorProfileController extends GetxController {
  final AuthServices _authServices = AuthServices.authInstance;
  final doctorModel = DoctorModel().obs;
  final selectedRole = "Doctor".obs;
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController specializationEditingController = TextEditingController();


  final List<bool> selectedCategory = [true, false, false].obs;
  Gender selectGender = Gender.male;
  final List<GenderButtonWidget> genderButtonWidget = [
    const GenderButtonWidget(
      icons: Icon(Icons.male),
      name: 'Male',
    ),
    const GenderButtonWidget(
      icons: Icon(Icons.female),
      name: 'Female',
    ),
    const GenderButtonWidget(
      name: 'Others',
    ),
  ];

  Future<void> storeUserData() async {
    try {
      _authServices.getUser();

      await DatabaseService.databaseService
          .setUserData(AuthServices.authInstance.user!.uid, doctorModel.value);
    } on FirebaseException catch (e) {
      CustomSnackBar.showMessage(e.message!);
    }
  }

  Future<void> storeImages() async {
    try {
      _authServices.getUser();

      FirebaseStorageServices.firebaseStorageServices.setUserImage(
          _authServices.user!.uid,
          File(Get.find<ImageController>().imagePath.value));
    } on FirebaseException catch (e) {
      CustomSnackBar.showMessage(e.message!);
    }
  }

  void setUserData() async {
    LoadingDialog.showLoading();
    try {
      await storeUserData();
      await storeImages();
      LoadingDialog.hideLoading();

      Get.offAndToNamed(AppScreen.doctorHomeScreen);
      nameEditingController.dispose();
      ageEditingController.dispose();
      Get.delete<DoctorProfileController>();
      Get.delete<ImageController>();
    } catch (e) {
      Get.rawSnackbar(message: e.toString());
    }
  }

  void onSelectGender(int index) {
    for (int i = 0; i < selectedCategory.length; i++) {
      selectedCategory[i] = i == index;
    }

    selectGender = (index == 0
        ? Gender.male
        : index == 1
        ? Gender.female
        : Gender.others);
  }

  String? onValidate(String value) {
    if (value.isEmpty) {
      return "Required*";
    }
    return null;
  }


}
