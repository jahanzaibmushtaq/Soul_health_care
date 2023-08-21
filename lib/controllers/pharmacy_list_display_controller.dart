import 'package:get/get.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/models/pharmacy_model/pharmacy_model.dart';
import 'package:random_video_chat_app/services/database_services.dart';
import 'package:random_video_chat_app/services/firebase_storage_services.dart';

class PharmacyListController extends GetxController {
  final pharmaciesList = <PharmacyListModel>[];
  final isLoading = true.obs;

  void fetchPharmacyList()async{
    isLoading.value = true;
    final data = await DatabaseService.databaseService.getPharmacyList();
    for (var value in data) {
      final latitude = value.data()['lat'] as String?;
      final longitude = value.data()['lng'] as String?;
      pharmaciesList.add(
        PharmacyListModel(
          image: await FirebaseStorageServices.firebaseStorageServices.getUserImage(value.id),
          id: value.id,
          pharmacyModel: PharmacyModel.fromJson(value.data()),
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
    fetchPharmacyList();
    // TODO: implement onInit
    super.onInit();
  }
}

class PharmacyListModel{
  final String id;
  final PharmacyModel pharmacyModel;
  final String image;
  final String phoneNumber;
  final String address;
  final double? lat;
  final double? lng;
  PharmacyListModel( {required this.id,required this.lat,
    required this.lng,required this.pharmacyModel,
    required this.image, required this.address, required this.phoneNumber});
}
