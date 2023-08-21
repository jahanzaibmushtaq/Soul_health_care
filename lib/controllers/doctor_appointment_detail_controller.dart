import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/services/database_services.dart';

class DoctorAppointmentsController extends GetxController {
  final DatabaseService _databaseService = DatabaseService();
  final DoctorsListController doctorListController = Get.put(DoctorsListController());

  final isLoading = true.obs;
  final RxList<DoctorAppointmentModel> appointments = RxList<DoctorAppointmentModel>();

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    isLoading.value = true;

    // Implement the logic to fetch the list of appointments for the doctor
    // You can use the appropriate method or service to fetch the appointments
    // For example:
    appointments.value = await _databaseService.getAppointment(doctorListController);

    isLoading.value = false;
  }

  void acceptAppointment(DoctorAppointmentModel appointment) async {
    // Implement the logic to accept the appointment
    // For example:
    appointment.status = 'Accepted';
    await _databaseService.updateAppointmentStatus(appointment);

    // Refresh the list of appointments
    fetchAppointments();
  }

  void rejectAppointment(DoctorAppointmentModel appointment) async {
    // Implement the logic to reject the appointment
    // For example:
    appointment.status = 'Rejected';
    await _databaseService.updateAppointmentStatus(appointment);

    // Refresh the list of appointments
    fetchAppointments();
  }

  Future<bool> updateAppointmentStatus(DoctorAppointmentModel appointment, String status) async {
    // Set the new status for the appointment
    appointment.status = status;

    // Update the appointment status in the database
    bool success = await _databaseService.updateAppointmentStatus(appointment);

    // Refresh the list of appointments
    fetchAppointments();

    return success;
  }



}
