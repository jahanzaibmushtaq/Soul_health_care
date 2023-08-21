import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/const/app_screens.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/controllers/pharmacy_list_display_controller.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/services/firebase_storage_services.dart';



class PharmacyListScreen extends StatelessWidget {
  const PharmacyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pharmacyListController = Get.find<PharmacyListController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Pharmacies'),
      ),
      body: Obx(
            ()=> pharmacyListController.isLoading.isFalse?
        ListView.builder(
          itemCount: pharmacyListController.pharmaciesList.length,
          itemBuilder: (context, index) {
            PharmacyListModel pharmacyModel = pharmacyListController.pharmaciesList[index];
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(pharmacyModel.image),
                    ),
                    title: Text(pharmacyModel.pharmacyModel.name!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${pharmacyModel.phoneNumber}'),
                        Text('Address: ${pharmacyModel.address}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.location_on_outlined,
                          color: Colors.blue),
                      onPressed: () {
                        Get.toNamed(
                          AppScreen.pharmacyMapScreen,
                          arguments: {
                            'pharmacyLatitude': pharmacyModel.lat!,
                            'pharmacyLongitude': pharmacyModel.lng!,
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


