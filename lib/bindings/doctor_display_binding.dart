import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';

class DoctorDisplayBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorsListController());
    // TODO: implement dependencies
  }
}