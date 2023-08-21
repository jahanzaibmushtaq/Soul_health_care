import 'package:get/get.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';

class ImageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ImageController());
    // TODO: implement dependencies
  }
}