import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/doctor_edit_profile_controller.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/services/database_services.dart';
import 'package:random_video_chat_app/services/firebase_storage_services.dart';

class DoctorsListController extends GetxController {
  final doctorsList = <DoctorListModel>[].obs;
  final isLoading = true.obs;
  final FirebaseStorageServices _firebaseStorageServices = FirebaseStorageServices();


  @override
  void onInit() {
    fetchDoctorList();
    super.onInit();
  }

  void fetchDoctorList() async {
    isLoading.value = true;
    try {
      final data = await DatabaseService().getDoctorList();
      final List<DoctorListModel> newList = [];

      for (var value in data) {
        final latitude = value.data()['lat'] as String?;
        final longitude = value.data()['lng'] as String?;

        final doctorModel = DoctorModel.fromJson(value.data());
        final doctorId = value.id;

        final image = await _firebaseStorageServices.getUserImage(doctorId); // Retrieve the user's profile image

        final doctorList = DoctorListModel(
          id: doctorId,
          doctorModel: doctorModel,
          image: await FirebaseStorageServices().getUserImage(doctorId),
          lat: latitude != null ? double.tryParse(latitude) : null,
          lng: longitude != null ? double.tryParse(longitude) : null,
          phoneNumber: value.data()['phoneNumber'] ?? '',
          address: value.data()['address'] ?? '',
          name: doctorModel.name ?? '',
          specialization: doctorModel.specialization ?? '',
          status: '',
        );

        newList.add(doctorList);
      }

      doctorsList.value = newList;
    } catch (e) {
      print('Error fetching doctor list: $e');
    } finally {
      isLoading.value = false;
    }
  }



  DoctorListModel? getDoctorById(String? doctorId) {
    if (doctorId == null) return null;
    return doctorsList.firstWhereOrNull((doctor) => doctor.id == doctorId);
  }

}

class DoctorListModel {
  final String id;
  final DoctorModel doctorModel;
  final String image;
  final double? lat;
  final double? lng;
  final String phoneNumber;
  final String address;
  final String name;
  final String specialization;
  final String status;

  DoctorListModel({
    required this.id,
    required this.doctorModel,
    required this.image,
    required this.lat,
    required this.lng,
    required this.phoneNumber,
    required this.address,
    required this.name,
    required this.specialization,
    required this.status,
  });
}
