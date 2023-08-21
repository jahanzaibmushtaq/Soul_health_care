import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/video_chat_controller.dart';

class VideoChatBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => VideoChatController());
    // TODO: implement dependencies
  }
}