import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/const/app_screens.dart';
import 'package:random_video_chat_app/controllers/doctor_book_appointment_controller.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/views/patient_appointment_details_screen/patient_appointment_details_screen.dart';

class DoctorsListScreen extends StatelessWidget {
  final DoctorsListController doctorListController =
      Get.find<DoctorsListController>();

  DoctorsListScreen({Key? key}) : super(key: key) {
    doctorListController.fetchDoctorList();
  }
  final RxList<DoctorAppointmentModel> appointments = <DoctorAppointmentModel>[].obs;
  final DoctorAppointmentController doctorAppointmentController = Get.put(DoctorAppointmentController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Doctors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              await doctorAppointmentController.fetchAppointments();
              final List<DoctorAppointmentModel> appointments = doctorAppointmentController.appointments.toList();
              Get.to(() => PatientAppointmentDetailsScreen(appointments: appointments,));
            },
          ),


        ],
      ),
      body: Obx(
        () {
          if (doctorListController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: doctorListController.doctorsList.length,
              itemBuilder: (context, index) {
                final doctorModel = doctorListController.doctorsList[index];
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(doctorModel.image),
                        ),
                        title: Text(doctorModel.doctorModel.name!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(doctorModel.doctorModel.specialization!),
                            Text('Phone: ${doctorModel.phoneNumber}'),
                            Text('Address: ${doctorModel.address}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.location_on_outlined,
                              color: Colors.blue),
                          onPressed: () {
                            Get.toNamed(
                              AppScreen.doctorMapScreen,
                              arguments: {
                                'doctorLatitude': doctorModel.lat!,
                                'doctorLongitude': doctorModel.lng!,
                              },
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle onPressed for the "Book Appointment" button
                          // Add your logic here to book an appointment with the doctor

                          // Example logic: Navigate to the appointment booking screen
                          Get.toNamed(
                            AppScreen.doctorAppointmentPopupScreen,
                            arguments: {
                              'doctorId': doctorModel.id, // Pass the doctor details as an argument
                            },
                          );
                        },
                        child: const Text("Book Appointment"),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
