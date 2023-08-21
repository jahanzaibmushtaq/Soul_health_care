import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_profile_controller.dart';

class DoctorProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorProfileController());
    // TODO: implement dependencies
  }
}