import 'package:get/get.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/models/hospital_model/hospital_model.dart';
import 'package:random_video_chat_app/models/lab_model/lab_model.dart';
import 'package:random_video_chat_app/models/pharmacy_model/pharmacy_model.dart';
import 'package:random_video_chat_app/services/database_services.dart';
import 'package:random_video_chat_app/services/firebase_storage_services.dart';

class HospitalListController extends GetxController {
  final hospitalList = <HospitalListModel>[];
  final isLoading = true.obs;

  void fetchHospitalList() async {
    try {
      isLoading.value = true;
      final data = await DatabaseService.databaseService.getHospitalList();
      hospitalList.clear();
      for (var value in data) {
        final latitude = value.data()['lat'] as String?;
        final longitude = value.data()['lng'] as String?;
        hospitalList.add(
          HospitalListModel(
            image: await FirebaseStorageServices.firebaseStorageServices.getUserImage(value.id),
            id: value.id,
            hospitalModel: HospitalModel.fromJson(value.data()),
            lat: latitude != null ? double.tryParse(latitude) : null,
            lng: longitude != null ? double.tryParse(longitude) : null,
            phoneNumber: value.data()['phoneNumber'] ?? '',
            address: value.data()['address'] ?? '',
          ),
        );
      }
    } catch (error) {
      print('Error fetching hospital list: $error');
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    fetchHospitalList();
    // TODO: implement onInit
    super.onInit();
  }
}

class HospitalListModel {
  final String id;
  final HospitalModel hospitalModel;
  final String image;
  final String phoneNumber;
  final String address;
  final double? lat;
  final double? lng;

  HospitalListModel({
    required this.id,
    required this.hospitalModel,
    required this.image,
    required this.phoneNumber,
    required this.address,
    required this.lat,
    required this.lng,
  });
}

