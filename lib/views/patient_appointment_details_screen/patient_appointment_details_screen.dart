import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_video_chat_app/controllers/home_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/services/auth_services.dart';

class PatientAppointmentDetailsScreen extends StatelessWidget {
  final List<DoctorAppointmentModel> appointments;
  final AuthServices authService = Get.put(AuthServices()); // Inject the AuthService

  PatientAppointmentDetailsScreen({required this.appointments});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthServices>();
    final currentUserId = authService.user?.uid;

    // Filter the appointments based on the current user's ID
    final filteredAppointments = appointments.where((appointment) => appointment.patientId == currentUserId).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: filteredAppointments.isEmpty
            ? Center(
          child: Text(
            'No appointments found.',
            style: TextStyle(color: Colors.black),
          ),
        )
            : ListView.builder(
          itemCount: filteredAppointments.length,
          itemBuilder: (context, index) {
            final appointment = filteredAppointments[index];
            return _buildAppointmentCard(appointment);
          },
        ),
      ),
    );
  }


  Widget _buildAppointmentCard(DoctorAppointmentModel appointment) {
    final doctor = appointment.doctor;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Doctor: ${doctor?.name ?? 'N/A'}'),
                    const SizedBox(height: 4),
                    Text('Specialization: ${doctor?.specialization ?? 'N/A'}'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Appointment Date & Time: ${_formatDateTime(appointment.appointmentDateTime ?? "")}'),
            const SizedBox(height: 8),
            Text('Condition: ${appointment.condition}'),
            const SizedBox(height: 8),
            Text('Status: ${_formatStatus(appointment.status)}'),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(String dateTimeString) {
    DateTime dateTime;
    try {
      dateTime = DateTime.parse(dateTimeString);
    } catch (error) {
      print('Error parsing date time: $error');
      return '';
    }

    final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    final formattedTime = DateFormat('HH:mm').format(dateTime);
    return '$formattedDate $formattedTime';
  }

  String _formatStatus(String? status) {
    if (status == 'pending') {
      return 'Pending';
    } else if (status == 'accepted') {
      return 'Accepted';
    } else if (status == 'rejected') {
      return 'Rejected';
    } else {
      return 'N/A';
    }
  }
}
