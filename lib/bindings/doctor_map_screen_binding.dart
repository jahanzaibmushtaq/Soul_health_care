import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/controllers/doctors_map_screen_controller.dart';

class DoctorMapScreenBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorsMapScreenController());
    // TODO: implement dependencies
  }
}