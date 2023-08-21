import 'package:get/get.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:random_video_chat_app/views/doctor_appointments_detail_screen/doctor_appointment_detail_screen.dart';
import 'package:random_video_chat_app/views/patient_appointment_details_screen/patient_appointment_details_screen.dart';



class HomeController extends GetxController {
  final _pageIndex = 0.obs;

  void setPageIndex(int index) => _pageIndex(index);

  get getPageIndex => _pageIndex.value;


  List<dynamic> pageList = [DashBoardPage(),DashBoardPage() ];

}
