import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/const/app_screens.dart';
import 'package:random_video_chat_app/controllers/lab_display_controller.dart';



class LabListScreen extends StatelessWidget {
  const LabListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final labListController = Get.find<LabListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Labs'),
      ),
      body: Obx(
            ()=> labListController.isLoading.isFalse?
        ListView.builder(
          itemCount: labListController.labList.length,
          itemBuilder: (context, index) {
            LabListModel labModel = labListController.labList[index];
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(labModel.image),
                    ),
                    title: Text(labModel.labModel.name!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${labModel.phoneNumber}'),
                        Text('Address: ${labModel.address}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.location_on_outlined,
                          color: Colors.blue),
                      onPressed: () {
                        Get.toNamed(
                          AppScreen.labMapScreen,
                          arguments: {
                            'pharmacyLatitude': labModel.lat!,
                            'pharmacyLongitude': labModel.lng!,
                          },
                        );
                      },
                    ),
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


