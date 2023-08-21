import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/controllers/dashboard_controller.dart';
import 'package:random_video_chat_app/controllers/user_profile_controller.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:random_video_chat_app/views/screens/user_profile/widget/custom_drawer_dashboard.dart';

class DashBoardPage extends StatelessWidget {
  DashBoardPage({Key? key}) : super(key: key);
  final dashBoardController = Get.put(DashboardController());
  final UserProfileController userProfileController =
      Get.put(UserProfileController());

  void logout() async {
    try {
      await AuthServices.authInstance.logout();
      await LocalStorageService.localStorageInstance.removeSession();
      Get.offAllNamed('/signInScreen');
      // You can also add additional sign out logic for other providers if needed
    } catch (e) {
      print('Error occurred during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.blue,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Soul HealthCare',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Text(
                          'Hello User',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      "Book Doctor Appointment",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppScreen.doctorsListScreen);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.doctorLogo,
                              height: 145,
                              width: 145,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Find Doctors",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Nearby Services",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppScreen.pharmacyListScreen);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.pharmaLogo,
                                  height: 130,
                                  width: 130,
                                ),
                                const SizedBox(height: 8),
                                const Row(
                                  children: [
                                    Text(
                                      "Pharmacy",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppScreen.labListScreen);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.labLogo,
                                  height: 130,
                                  width: 130,
                                ),
                                const SizedBox(height: 8),
                                const Row(
                                  children: [
                                    Text(
                                      "Labs",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppScreen.hospitalListScreen);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              AppImages.hospitalLogo,
                              height: 170,
                              width: 170,
                            ),
                            const SizedBox(width: 25),
                            const Text(
                              "Hospitals",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
