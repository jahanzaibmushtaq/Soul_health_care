import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/services/auth_services.dart';
import 'package:random_video_chat_app/services/database_services.dart';

class PatientAppointmentDetailsController extends GetxController {
  final DatabaseService _databaseService = DatabaseService();
  final Rx<DoctorAppointmentModel> appointment = Rx<DoctorAppointmentModel>(DoctorAppointmentModel());
  final DoctorsListController doctorListController = Get.find<DoctorsListController>();

  Future<void> getAppointment(String appointmentId) async {
    final result = await _databaseService.getAppointment(appointmentId as DoctorsListController);
    appointment.value = result as DoctorAppointmentModel;
  }


  String getAppointmentStatus() {
    if (appointment.value.isAccepted == true) {
      return 'Accepted';
    } else if (appointment.value.isAccepted == false) {
      return 'Rejected';
    } else {
      return 'Pending';
    }
  }
}
