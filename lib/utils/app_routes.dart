import 'package:get/get.dart';
import 'package:random_video_chat_app/bindings/doctor_book_appointment_binding.dart';
import 'package:random_video_chat_app/bindings/doctor_display_binding.dart';
import 'package:random_video_chat_app/bindings/doctor_edit_profile_binding.dart';
import 'package:random_video_chat_app/bindings/doctor_home_screen_binding.dart';
import 'package:random_video_chat_app/bindings/doctor_map_screen_binding.dart';
import 'package:random_video_chat_app/bindings/doctor_profile_binding.dart';
import 'package:random_video_chat_app/bindings/home_binding.dart';
import 'package:random_video_chat_app/bindings/hospital_display_binding.dart';
import 'package:random_video_chat_app/bindings/lab_display_binding.dart';
import 'package:random_video_chat_app/bindings/patient_appointment_details_binding.dart';
import 'package:random_video_chat_app/bindings/pharmacy_display_binding.dart';
import 'package:random_video_chat_app/bindings/user_profile_binding.dart';
import 'package:random_video_chat_app/controllers/doctor_profile_controller.dart';
import 'package:random_video_chat_app/models/book_doctor_appointment_model/book_doctor_appointment_model.dart';
import 'package:random_video_chat_app/views/doctor_appointments_detail_screen/doctor_appointment_detail_screen.dart';
import 'package:random_video_chat_app/views/doctor_book_appointment_screen/doctor_book_appointment_screen.dart';
import 'package:random_video_chat_app/views/doctors_list_display_screen/doctors_list_display_screen.dart';
import 'package:random_video_chat_app/views/map_doctors/doctors_map_screen.dart';
import 'package:random_video_chat_app/views/map_hospital/hospital_map_screen.dart';
import 'package:random_video_chat_app/views/map_lab_screen/map_lab_screen.dart';
import 'package:random_video_chat_app/views/map_pharmacy/map_pharmacy_screen.dart';
import 'package:random_video_chat_app/views/patient_appointment_details_screen/patient_appointment_details_screen.dart';
import 'package:random_video_chat_app/views/pharmacy_display_screen/pharmacy_display_screen.dart';
import 'package:random_video_chat_app/views/screens/doctor_screens/doctor_profile_screen.dart';
import 'package:random_video_chat_app/views/screens/home_screen/doctor_home_screen/doctor_home_screen.dart';
import 'package:random_video_chat_app/views/screens/home_screen/home_screen.dart';
import 'package:random_video_chat_app/views/screens/hospital_display_screen/hospital_display_screen.dart';
import 'package:random_video_chat_app/views/screens/hospital_screens/hospital_profile_screen.dart';
import 'package:random_video_chat_app/views/screens/lab_display_screen/lab_display_screen.dart';
import 'package:random_video_chat_app/views/screens/lab_screens/lab_profile_screen.dart';
import 'package:random_video_chat_app/views/screens/pharmacy_screens/pharmacy_profile_screen.dart';
import 'package:random_video_chat_app/views/screens/sign_in_screen/sign_in_category.dart';
import 'package:random_video_chat_app/views/screens/splash_screen/splash_screen.dart';

import 'app_imports.dart';

class AppRoutes {
  static List<GetPage> pages = <GetPage>[
    GetPage(
        name: AppScreen.initialScreen,
        page: () => const SplashScreen(),

       ),
    GetPage(
        name: AppScreen.userCategoryPage,
        page: () => const UserCategoryPage(),
        binding: UserProfileBinding()),
    GetPage(
        name: AppScreen.doctorProfileScreen,
        page: () => const DoctorProfileScreen(),
        binding: DoctorProfileBinding()),

    GetPage(
        name: AppScreen.profileScreen,
        page: () => const UserProfileScreen(),
        ),
    GetPage(
      name: AppScreen.labProfileScreen,
      page: () => const LabProfileScreen(),
    ),
    GetPage(
      name: AppScreen.hospitalProfileScreen,
      page: () => const HospitalProfileScreen(),
    ),
    GetPage(
      name: AppScreen.pharmacyProfileScreen,
      page: () => const PharmacyProfileScreen(),
    ),
    GetPage(
        name: AppScreen.profileImageScreen,
        page: () => ProfileImageScreen(),
        binding: ImageBinding()),
    GetPage(
        name: AppScreen.doctorsListScreen,
        page: () =>  DoctorsListScreen(),
    binding: DoctorDisplayBinding()),
    GetPage(
        name: AppScreen.pharmacyListScreen,
        page: () => const PharmacyListScreen(),
        binding: PharmacyDisplayBinding()),
    GetPage(
        name: AppScreen.labListScreen,
        page: () => const LabListScreen(),
        binding: LabDisplayBinding()),
    GetPage(
      name: AppScreen.doctorMapScreen,
      page: () => const DoctorMapScreen(),
      binding: DoctorMapScreenBinding(),
    ),
    GetPage(
      name: AppScreen.hospitalMapScreen,
      page: () => const HospitalMapScreen(),
    ),

    GetPage(
      name: AppScreen.pharmacyMapScreen,
      page: () => const PharmacyMapScreen(),
    ),
    GetPage(
      name: AppScreen.labMapScreen,
      page: () => const LabMapScreen(),
    ),
    /*GetPage(
        name: AppScreen.doctorEditProfileScreen,
        page: () =>  DoctorDrawer(),
        binding: DoctorEditProfileBinding()),*/
    GetPage(
        name: AppScreen.doctorAppointmentPopupScreen,
        page: () =>  const DoctorAppointmentPopupScreen(),
        binding: DoctorBookAppointmentBinding()),
    GetPage(
      name: AppScreen.patientAppointmentDetailsScreen,
      page: () => PatientAppointmentDetailsScreen(appointments: [],),
      binding: PatientAppointmentDetailBinding(),
    ),
    GetPage(
        name: AppScreen.hospitalListScreen,
        page: () => const HospitalListScreen(),
        binding: HospitalDisplayBinding()),
    GetPage(
        name: AppScreen.doctorAppointmentsScreen,
        page: () =>  DoctorAppointmentsScreen(),
        binding: DoctorBookAppointmentBinding()),
    GetPage(
        name: AppScreen.doctorHomeScreen,
        page: () =>  DoctorHomeScreen(),
        binding: DoctorHomeScreenBinding()),
    GetPage(
        name: AppScreen.signInScreen,
        page: () => const SignInScreen(),
        binding: AuthBinding()),
    GetPage(
        name: AppScreen.homeScreen,
        page: () =>  HomeScreen(),
        binding: HomeBinding()),
  ];
}
