import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/controllers/lab_display_controller.dart';

class LabDisplayBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LabListController());
    // TODO: implement dependencies
  }
}