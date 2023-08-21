import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/const/app_screens.dart';
import 'package:random_video_chat_app/controllers/hospital_display_controller.dart';
import 'package:random_video_chat_app/controllers/lab_display_controller.dart';



class HospitalListScreen extends StatelessWidget {
  const HospitalListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hospitalListController = Get.find<HospitalListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Hospitals'),
      ),
      body: Obx(
            ()=> hospitalListController.isLoading.isFalse?
        ListView.builder(
          itemCount: hospitalListController.hospitalList.length,
          itemBuilder: (context, index) {
            HospitalListModel hospitalModel = hospitalListController.hospitalList[index];
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(hospitalModel.image),
                    ),
                    title: Text(hospitalModel.hospitalModel.name!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${hospitalModel.phoneNumber}'),
                        Text('Address: ${hospitalModel.address}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.location_on_outlined,
                          color: Colors.blue),
                      onPressed: () {
                        Get.toNamed(
                          AppScreen.hospitalMapScreen,
                          arguments: {
                            'hospitalLatitude': hospitalModel.lat!,
                            'hospitalLongitude': hospitalModel.lng!,
                          },
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        AppScreen.doctorAppointmentPopupScreen,
                        arguments: {
                          'doctorId': hospitalModel.id, // Pass the doctor details as an argument
                        },
                      );
                    },
                    child: const Text("Book Appointment"),
                  ),
                ],
              ),
            );
          },
        ):
        const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}


