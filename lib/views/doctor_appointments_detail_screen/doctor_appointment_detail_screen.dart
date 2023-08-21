
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_video_chat_app/controllers/doctor_appointment_detail_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';

class DoctorAppointmentsScreen extends StatefulWidget {
  @override
  State<DoctorAppointmentsScreen> createState() => _DoctorAppointmentsScreenState();
}

class _DoctorAppointmentsScreenState extends State<DoctorAppointmentsScreen> {
  final DoctorAppointmentsController _appointmentsController = Get.put(DoctorAppointmentsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: Obx(() {
      if (_appointmentsController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (_appointmentsController.appointments.isEmpty) {
        return Center(
          child: Text(
            'No appointments found.',
            style: TextStyle(color: Colors.black),
          ),
        );
      } else {
        return ListView.builder(
          itemCount: _appointmentsController.appointments.length,
          itemBuilder: (context, index) {
            final appointment = _appointmentsController.appointments[index];
            return _buildAppointmentCard(appointment);
          },
        );
      }
    }),

    );
  }

  Widget _buildAppointmentCard(DoctorAppointmentModel appointment) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient Name: ${appointment.patientName}'),
            const SizedBox(height: 8),
            Text('Appointment Date & Time: ${appointment.dateTime}'),
            const SizedBox(height: 8),
            Text('Condition: ${appointment.condition}'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => _updateStatus(context, appointment, 'Accepted'),
                  child: const Text('Accept'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _updateStatus(context, appointment, 'Rejected'), // Change "Reject" to "Rejected"
                  child: const Text('Reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateStatus(BuildContext context, DoctorAppointmentModel appointment, String status) async {
    bool? success = await _appointmentsController.updateAppointmentStatus(appointment, status);
    if (success != null && success) {
      if (status == 'Accepted') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Appointment $status successfully'),
          ),
        );
      } else if (status == 'Rejected') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Appointment rejected successfully'),
          ),
        );
        setState(() {
          _appointmentsController.appointments.remove(appointment);
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Failed to update appointment status'),
        ),
      );
    }
  }

}
