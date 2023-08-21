import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/services/database_services.dart';

class DoctorAppointmentController extends GetxController {
  final DatabaseService _databaseService = DatabaseService();
  final RxList<DoctorAppointmentModel> appointments = <DoctorAppointmentModel>[].obs;
  final DoctorsListController doctorListController = Get.put(DoctorsListController());


  //  bookAppointment(DoctorAppointmentModel appointment) {
  //   _databaseService.createAppointment(appointment);
  // }
  @override
  void onInit() {
    fetchAppointments();
    super.onInit();
  }

   fetchAppointments() async {
    final doctorListController = Get.find<DoctorsListController>();

    try {
      appointments.value = await DatabaseService.databaseService.getAppointment(doctorListController);
    } catch (e) {
      print('Error fetching appointments: $e');
    }
  }

   bookAppointment(DoctorAppointmentModel appointment) async {
    try {
      await _databaseService.createAppointment(appointment);
      fetchAppointments(); // Update the appointments list after booking
    } catch (e) {
      print('Error booking appointment: $e');
    }
  }


}
