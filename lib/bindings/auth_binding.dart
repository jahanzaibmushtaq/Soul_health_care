import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/internet_connection_controller.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ConnectionController());
  }
}