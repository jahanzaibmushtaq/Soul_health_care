import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/models/doctor_model/doctor_model.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:random_video_chat_app/services/auth_services.dart';


class DatabaseService {
  static final DatabaseService _databaseService =
      DatabaseService._initialization();

  DatabaseService._initialization();

  factory DatabaseService() {
    return _databaseService;
  }

  static DatabaseService get databaseService => _databaseService;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> setUserData(String id, var userModel) async {
    await firebaseFirestore.collection("user").doc(id).set(userModel.toJson());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String id) async {
    return await firebaseFirestore.collection("user").doc(id).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDataByCategory(String category) async {
    return await firebaseFirestore.collection("user").where("category", isEqualTo: category).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorData() async {
    return await firebaseFirestore.collection("user").where("category", isEqualTo: "doctor").get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getHospitalData() async {
    return await firebaseFirestore.collection("user").where("category", isEqualTo: "hospital").get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getLabData() async {
    return await firebaseFirestore.collection("user").where("category", isEqualTo: "lab").get();
  }



  Future<bool> checkUserExist(String userId) async {
    DocumentSnapshot data =
        await firebaseFirestore.collection("user").doc(userId).get();
    return data.exists;
  }

  Future<List<QueryDocumentSnapshot<Map<String,dynamic>>>> getDoctorList() async {
    final data = await firebaseFirestore
        .collection("user")
        .where("category", isEqualTo: "Doctor" ).where("isVerified",isEqualTo:true)
        .get();
    return data.docs;
  }
  Future<List<QueryDocumentSnapshot<Map<String,dynamic>>>> getPharmacyList() async {
    final data = await firebaseFirestore
        .collection("user")
        .where("category", isEqualTo: "Pharmacy" ).where("isVerified",isEqualTo:true)
        .get();
    return data.docs;
  }
  Future<List<QueryDocumentSnapshot<Map<String,dynamic>>>> getLabList() async {
    final data = await firebaseFirestore
        .collection("user")
        .where("category", isEqualTo: "Lab" ).where("isVerified",isEqualTo:true)
        .get();
    return data.docs;
  }
  Future<List<QueryDocumentSnapshot<Map<String,dynamic>>>> getHospitalList() async {
    final data = await firebaseFirestore
        .collection("user")
        .where("category", isEqualTo: "Hospital" ).where("isVerified",isEqualTo:true)
        .get();
    return data.docs;
  }
  Future<void> deleteDoctor(String doctorId) async {
    // Delete the doctor document from the "user" collection
    await firebaseFirestore.collection('user').doc(doctorId).delete();
  }

  Future<DoctorModel> fetchDoctor(String doctorId) async {
    final snapshot =
    await firebaseFirestore.collection("user").doc(doctorId).get();
    final doctorData = snapshot.data();
    if (doctorData != null) {
      return DoctorModel.fromJson(doctorData);
    } else {
      throw Exception('Doctor not found');
    }
  }

  Future<void> updateDoctor(String doctorId, DoctorModel doctor) async {
    final collection = FirebaseFirestore.instance.collection("user");
    final querySnapshot = await collection.where(
        "category", isEqualTo: "Doctor").get();

    for (final doc in querySnapshot.docs) {
      if (doc.id == doctorId) {
        await doc.reference.update(doctor.toJson());
        break;
      }
    }
  }

  Future<void> createAppointment(DoctorAppointmentModel appointment) async {
    try {
      // Generate a new document ID
      final appointmentDocRef =
      FirebaseFirestore.instance.collection('appointments').doc();
      final appointmentId = appointmentDocRef.id;

      // Create a new appointment map with the appointmentDateTime and generated ID
      final Map<String, dynamic> appointmentData = {
        ...appointment.toJson(),
        'appointmentDateTime': appointment.appointmentDateTime,
        'id': appointmentId,
      };

      // Set the appointment data in the document using the generated ID
      await appointmentDocRef.set(appointmentData);
    } catch (error) {
      print('Error creating appointment: $error');
      rethrow;
    }
  }





  Future<List<DoctorAppointmentModel>> getAppointment(DoctorsListController doctorListController) async {
    final appointmentSnapshot = await FirebaseFirestore.instance.collection('appointments').get();

    final List<DoctorAppointmentModel> appointments = [];

    for (final doc in appointmentSnapshot.docs) {
      final appointmentData = doc.data();
      final doctorId = appointmentData?['doctorId'] as String?;
      final appointment = DoctorAppointmentModel.fromJson(appointmentData as Map<String, dynamic>);
      final doctorListModel = doctorListController.getDoctorById(doctorId);
      appointment.doctor = doctorListModel?.doctorModel;

      if (appointment.patientId != null) {
        final patientName = await DatabaseService.databaseService.getPatientName(appointment.patientId!);
        if (patientName != null) {
          appointment.patientName = patientName;
        }
      }

      appointments.add(appointment);
    }

    return appointments;
  }


  Future<String?> getPatientName(String patientId) async {
    try {
      var userData = await firebaseFirestore.collection('user').doc(patientId).get();
      if (userData.exists) {
        var patientName = userData.data()?['name'];
        if (patientName != null) {
          return patientName as String;
        }
      }
    } catch (e) {
      print('Error fetching patient name: $e');
    }

    return null; // Return null if patient name cannot be fetched
  }
  Future<bool> updateAppointmentStatus(DoctorAppointmentModel appointment) async {
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointment.id)
          .update({'status': appointment.status});
      print('Appointment status updated successfully');
      return true;
    } catch (error) {
      print('Error updating appointment status: $error');
      return false;
    }
  }





}
