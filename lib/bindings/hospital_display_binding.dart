import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/controllers/hospital_display_controller.dart';

class HospitalDisplayBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HospitalListController());
    // TODO: implement dependencies
  }
}