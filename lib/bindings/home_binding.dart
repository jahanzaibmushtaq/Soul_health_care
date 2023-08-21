import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/dashboard_controller.dart';
import 'package:random_video_chat_app/controllers/home_controller.dart';
import 'package:random_video_chat_app/controllers/internet_connection_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => ConnectionController());
  }
}
