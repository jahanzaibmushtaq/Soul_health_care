import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_appointment_detail_controller.dart';

class DoctorAppointmentsBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorAppointmentsController());
    // TODO: implement dependencies
  }
}