
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/internet_connection_controller.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/models/hospital_model/hospital_model.dart';
import 'package:random_video_chat_app/models/lab_model/lab_model.dart';
import 'package:random_video_chat_app/models/pharmacy_model/pharmacy_model.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:random_video_chat_app/views/dialogs/loading_dialogs.dart';
import 'package:random_video_chat_app/views/dialogs/verification_dialog.dart';

class AuthController extends GetxController {
  final AuthServices _authServices = AuthServices.authInstance;
  final connectionController = Get.find<ConnectionController>();
  final userModel = UserModel().obs;
  void onGoogleSignIn() async {
    LoadingDialog.showLoading();
    if (connectionController.connection.isTrue) {
      try {
        UserCredential userCredential = await _authServices.signInWithGoogle();
        bool isExist = await DatabaseService.databaseService
            .checkUserExist(userCredential.user!.uid);
        if (isExist) {
          DocumentSnapshot<Map<String, dynamic>> userData = await DatabaseService
              .databaseService
              .getUserData(userCredential.user!.uid);
          if (userData.data()!["category"] == "Patient") {
            userModel.value = UserModel.fromJson(userData.data()!);
            LoadingDialog.hideLoading();
                  
            LocalStorageService.localStorageInstance.setUserData(userModel.value);
                     Get.toNamed(AppScreen.homeScreen);
          }else if (userData.data()!["category"] == "Doctor"){
            DoctorModel doctorModel = DoctorModel.fromJson(userData.data()!);
            if(doctorModel.isVerified == true){
              LoadingDialog.hideLoading();

              Get.offAndToNamed(AppScreen.doctorHomeScreen);
            }else{
              LoadingDialog.hideLoading();

              VerificationDialog.showDialog();
            }
          }
          else if (userData.data()!["category"] == "Hospital"){
            HospitalModel hospitalModel = HospitalModel.fromJson(userData.data()!);
            if(hospitalModel.isVerified == true){
              LoadingDialog.hideLoading();

              Get.toNamed(AppScreen.homeScreen);
            }else{
              LoadingDialog.hideLoading();

              VerificationDialog.showDialog();
            }
          }
          else if (userData.data()!["category"] == "Lab"){
            LabModel labModel = LabModel.fromJson(userData.data()!);
            if(labModel.isVerified == true){
              LoadingDialog.hideLoading();

              Get.toNamed(AppScreen.homeScreen);
            }else{
              LoadingDialog.hideLoading();

              VerificationDialog.showDialog();
            }
          }
          else if (userData.data()!["category"] == "Pharmacy"){
            PharmacyModel pharmacyModel = PharmacyModel.fromJson(userData.data()!);
            if(pharmacyModel.isVerified == true){
              LoadingDialog.hideLoading();

              Get.toNamed(AppScreen.homeScreen);
            }else{
              LoadingDialog.hideLoading();

              VerificationDialog.showDialog();
            }
          }
        } else {
          LoadingDialog.hideLoading();
          Get.delete<AuthController>();
          Get.toNamed(AppScreen.userCategoryPage);
        }
      } on FirebaseAuthException catch (e) {
        LoadingDialog.hideLoading();
        CustomSnackBar.showMessage(e.message!);
      }
    }
    else{
      LoadingDialog.hideLoading();
      Get.rawSnackbar(message: "Internet issue",duration: Duration(milliseconds: 800));
    }
  }
}
