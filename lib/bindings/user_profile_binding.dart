import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/user_profile_controller.dart';

class UserProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserProfileController());
    // TODO: implement dependencies
  }
}