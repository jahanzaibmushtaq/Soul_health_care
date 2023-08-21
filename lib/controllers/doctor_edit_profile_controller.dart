// import 'package:get/get.dart';
// import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
// import 'package:random_video_chat_app/services/auth_services.dart';
//
// class DoctorDrawerController extends GetxController {
//   final doctor = DoctorModel().obs;
//
//   @override
//   void onInit() {
//     fetchDoctor();
//     super.onInit();
//   }
//
//   void fetchDoctor() async {
//     final doctorId = await AuthServices.getCurrentUserId();
//     // Fetch the doctor's data from the database based on the doctorId
//     // You can use the existing code for fetching the doctor details
//     // Replace the `fetchDoctor` implementation with the appropriate code
//     // to fetch the doctor's details based on the doctorId
//     // Set the doctor value using `doctor.value = fetchedDoctorData`
//     // Example:
//     // final fetchedDoctorData = await DatabaseService.databaseService.getDoctor(doctorId);
//     // doctor.value = fetchedDoctorData;
//   }
//
//   void logout() async {
//     // Perform any additional cleanup or logout actions
//     await AuthServices.authInstance.logout();
//     // Redirect the user to the login screen or home screen
//     // Example:
//     // Get.offAllNamed('/login');
//   }
// }
