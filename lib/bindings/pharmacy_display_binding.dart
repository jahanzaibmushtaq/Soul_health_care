import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/controllers/pharmacy_list_display_controller.dart';

class PharmacyDisplayBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PharmacyListController());
    // TODO: implement dependencies
  }
}