import 'package:get/get.dart';

import 'package:random_video_chat_app/controllers/patient_appointment_details_controller.dart';

class PatientAppointmentDetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PatientAppointmentDetailsController());
    // TODO: implement dependencies
  }
}