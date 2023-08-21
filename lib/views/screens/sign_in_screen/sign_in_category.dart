import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/const/app_images.dart';
import 'package:random_video_chat_app/const/app_screens.dart';
import 'package:random_video_chat_app/controllers/doctor_list_display_controller.dart';
import 'package:random_video_chat_app/controllers/user_profile_controller.dart';
import 'package:random_video_chat_app/utils/enums.dart';

class UserCategoryPage extends StatefulWidget {
  const UserCategoryPage({super.key});

  @override
  UserCategoryPageState createState() => UserCategoryPageState();
}

class UserCategoryPageState extends State<UserCategoryPage> {
  UserCategory userCategory = UserCategory.doctor;
  final userProfileController = Get.find<UserProfileController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                AppImages.logoIcon,
                height: 200,
                width: 150,
              ),
            ),
            ListTile(
              title: const Text('Doctor'),
              leading: Radio(
                value:UserCategory.doctor,
                groupValue: userCategory,
                onChanged: (value) {
                  setState(() {
                    userCategory = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Patient'),
              leading: Radio(
                value: UserCategory.patient,
                groupValue: userCategory,
                onChanged: (value) {
                  setState(() {
                    userCategory = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Hospital'),
              leading: Radio(
                value: UserCategory.hospital,
                groupValue: userCategory,
                onChanged: (value) {
                  setState(() {
                    userCategory = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Lab'),
              leading: Radio(
                value: UserCategory.lab,
                groupValue: userCategory,
                onChanged: (value) {
                  setState(() {
                    userCategory = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Pharmacy'),
              leading: Radio(
                value: UserCategory.pharmacy,
                groupValue: userCategory,
                onChanged: (value) {
                  setState(() {
                    userCategory = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 20.0,
              height: 30.0,),
            ElevatedButton(
              onPressed: () {
                  switch (userCategory) {
                    case UserCategory.patient:
                      userProfileController.selectedRole("Patient");
                      Get.toNamed( AppScreen.profileScreen);
                      break;
                    case UserCategory.doctor:
                      userProfileController.selectedRole("Doctor");
                      Get.toNamed( AppScreen.doctorProfileScreen);
                      break;
                    case UserCategory.lab:
                      userProfileController.selectedRole("Lab");
                      Get.toNamed( AppScreen.labProfileScreen);
                      break;
                    case UserCategory.hospital:
                      userProfileController.selectedRole("Hospital");
                      Get.toNamed( AppScreen.hospitalProfileScreen);
                      break;
                    case UserCategory.pharmacy:
                      userProfileController.selectedRole("Pharmacy");
                      Get.toNamed( AppScreen.pharmacyProfileScreen);
                      break;
                  }


              },
              child: const Text('Sign Up'),
            ),


          ],
        ),
      ),
    );
  }
}
