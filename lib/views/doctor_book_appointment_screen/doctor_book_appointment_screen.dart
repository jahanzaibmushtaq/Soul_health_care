import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_book_appointment_controller.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/services/database_services.dart';
import 'package:random_video_chat_app/views/doctors_list_display_screen/doctors_list_display_screen.dart';
import 'package:random_video_chat_app/views/patient_appointment_details_screen/patient_appointment_details_screen.dart';

class DoctorAppointmentPopupScreen extends StatefulWidget {
  const DoctorAppointmentPopupScreen({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentPopupScreenState createState() => _DoctorAppointmentPopupScreenState();
}

class _DoctorAppointmentPopupScreenState extends State<DoctorAppointmentPopupScreen> {
  final DoctorAppointmentController doctorAppointmentController = Get.find<DoctorAppointmentController>();
  final DoctorsListController doctorListController = Get.find<DoctorsListController>();

  final TextEditingController conditionController = TextEditingController();
  late DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = DateTime.now();
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (picked != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        });
      }
    }
  }

  void _bookAppointment(String doctorId) async {
    final condition = conditionController.text;
    final selectedDateTime = this.selectedDateTime;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    String? patientId;
    if (user != null) {
      patientId = user.uid;
    }

    if (patientId == null) {
      // Handle the case when the patientId is not available
      return;
    }

    if (condition.isEmpty) {
      // Show error message if condition is empty
      Get.snackbar(
        'Error',
        'Please enter a condition',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (selectedDateTime.isBefore(DateTime.now())) {
      // Show error message if selected date & time is in the past
      Get.snackbar(
        'Error',
        'Please select a valid date & time',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final appointment = DoctorAppointmentModel(
      doctorId: doctorId,
      patientId: patientId,
      appointmentDateTime: selectedDateTime.toString(),
      condition: condition,
    );

    // Call the bookAppointment method from your DoctorAppointmentController
    await doctorAppointmentController.bookAppointment(appointment);
    // Fetch the updated list of appointments after booking
    await doctorAppointmentController.fetchAppointments();

    // Show success message
    Get.snackbar(
      'Success',
      'Appointment booked successfully!',
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );



    // Pass the list of appointments as an argument when navigating to the details screen
    Get.to(() => PatientAppointmentDetailsScreen(appointments: doctorAppointmentController.appointments.toList(),));
  }

  Future<List<DoctorAppointmentModel>> fetchAppointments() async {
    // Implement the logic to fetch the list of appointments here
    // You can use the appropriate method or service to fetch the appointments
    // For example:
    final List<DoctorAppointmentModel> appointments = await DatabaseService().getAppointment(doctorListController);
    return appointments;
  }

  @override
  Widget build(BuildContext context) {
    final String doctorId = Get.arguments['doctorId'] as String;

    return AlertDialog(
      title: const Text('Book Appointment'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Selected Date & Time: ${selectedDateTime.toString()}'),
          const SizedBox(height: 16),
          TextField(
            controller: conditionController,
            decoration: const InputDecoration(
              labelText: 'Condition',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Select Date & Time'),
          onPressed: () => _selectDateTime(context),
        ),
        TextButton(
          child: const Text('Book Appointment'),
          onPressed: () => _bookAppointment(doctorId),
        ),
      ],
    );
  }
}
