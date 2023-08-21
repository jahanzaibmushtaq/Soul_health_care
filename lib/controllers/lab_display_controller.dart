import 'package:get/get.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/models/lab_model/lab_model.dart';
import 'package:random_video_chat_app/models/pharmacy_model/pharmacy_model.dart';
import 'package:random_video_chat_app/services/database_services.dart';
import 'package:random_video_chat_app/services/firebase_storage_services.dart';

class LabListController extends GetxController {
  final labList = <LabListModel>[];
  final isLoading = true.obs;

  void fetchLabList() async {
    isLoading.value = true;
    final data = await DatabaseService.databaseService.getLabList();
    for (var value in data) {
      final latitude = value.data()['lat'] as String?;
      final longitude = value.data()['lng'] as String?;
      labList.add(
        LabListModel(
          image: await FirebaseStorageServices.firebaseStorageServices.getUserImage(value.id),
          id: value.id,
          labModel: LabModel.fromJson(value.data()),
          lat: latitude != null ? double.tryParse(latitude) : null,
          lng: longitude != null ? double.tryParse(longitude) : null,
          phoneNumber: value.data()['phoneNumber'] ?? '',
          address: value.data()['address'] ?? '',
        ),
      );
    }
    isLoading(false);
  }

  @override
  void onInit() {
    fetchLabList();
    // TODO: implement onInit
    super.onInit();
  }
}

class LabListModel {
  final String id;
  final LabModel labModel;
  final String image;
  final String phoneNumber;
  final String address;
  final double? lat;
  final double? lng;
  LabListModel({required this.id,required this.lat,
    required this.lng,required this.labModel,
    required this.image, required this.address, required this.phoneNumber
  });
}
