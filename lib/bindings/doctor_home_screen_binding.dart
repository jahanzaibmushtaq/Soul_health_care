import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_home_controller.dart';

class DoctorHomeScreenBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorHomeController());
    // TODO: implement dependencies
  }
}