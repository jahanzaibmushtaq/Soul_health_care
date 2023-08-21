import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/models/hospital_model/hospital_model.dart';
import 'package:random_video_chat_app/models/lab_model/lab_model.dart';
import 'package:random_video_chat_app/models/pharmacy_model/pharmacy_model.dart';
import 'package:random_video_chat_app/services/firebase_storage_services.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:random_video_chat_app/views/dialogs/loading_dialogs.dart';
import 'package:random_video_chat_app/views/dialogs/verification_dialog.dart';
import 'package:random_video_chat_app/views/screens/user_profile/widget/gender_button_widget.dart';

class UserProfileController extends GetxController {
  final AuthServices _authServices = AuthServices.authInstance;
  final userModel = UserModel().obs;
  final doctorModel = DoctorModel().obs;
  final pharmacyModel = PharmacyModel().obs;
  final hospitalModel = HospitalModel().obs;
  final labModel = LabModel().obs;
  final selectedRole = "Doctor".obs;
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController addressEditingController = TextEditingController();
  final TextEditingController latitudeEditingController = TextEditingController();
  final TextEditingController longitudeEditingController = TextEditingController();





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
    if(selectedRole=='Patient'){
      await DatabaseService.databaseService
          .setUserData(AuthServices.authInstance.user!.uid, userModel.value);}
      else if(selectedRole=='Doctor'){
        await DatabaseService.databaseService
            .setUserData(AuthServices.authInstance.user!.uid, doctorModel.value);}
    else if(selectedRole=='Pharmacy'){
      await DatabaseService.databaseService
          .setUserData(AuthServices.authInstance.user!.uid, pharmacyModel.value);}
    else if(selectedRole=='Lab'){
      await DatabaseService.databaseService
          .setUserData(AuthServices.authInstance.user!.uid, labModel.value);}
    else if(selectedRole=='Hospital'){
      await DatabaseService.databaseService
          .setUserData(AuthServices.authInstance.user!.uid, hospitalModel.value);}
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

      if (selectedRole.value == "Patient") {
        Get.offAllNamed(AppScreen.homeScreen);
      }else if (selectedRole.value == "Doctor") {
        Get.offAllNamed(AppScreen.signInScreen);
          VerificationDialog.showDialog();
      }
      else if (selectedRole.value == "Pharmacy") {
        Get.offAllNamed(AppScreen.signInScreen);
        VerificationDialog.showDialog();
      }
      else if (selectedRole.value == "Lab") {
        Get.offAllNamed(AppScreen.signInScreen);
        VerificationDialog.showDialog();
      }
      else if (selectedRole.value == "Hospital") {
        Get.offAllNamed(AppScreen.signInScreen);
        VerificationDialog.showDialog();
      }
      nameEditingController.dispose();
      ageEditingController.dispose();
      phoneEditingController.dispose();
      addressEditingController.dispose();
      latitudeEditingController.dispose();
      longitudeEditingController.dispose();
      Get.delete<UserProfileController>();
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
