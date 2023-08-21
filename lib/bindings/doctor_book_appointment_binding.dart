import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_book_appointment_controller.dart';


class DoctorBookAppointmentBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorAppointmentController());
    // TODO: implement dependencies
  }
}