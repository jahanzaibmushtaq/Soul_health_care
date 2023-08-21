import 'package:get/get.dart';

class CustomSnackBar{
  static void showMessage(String message){
    Get.rawSnackbar(message: message);
  }
}