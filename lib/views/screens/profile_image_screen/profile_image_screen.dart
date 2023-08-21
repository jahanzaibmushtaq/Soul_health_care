import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/const/app_colors.dart';
import 'package:random_video_chat_app/controllers/user_profile_controller.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:random_video_chat_app/views/screens/profile_image_screen/bottom_sheet/profile_image_bottom_sheet.dart';
import 'package:random_video_chat_app/views/screens/sign_in_screen/widgets/custom_button.dart';

class ProfileImageScreen extends StatelessWidget {
  ProfileImageScreen({Key? key}) : super(key: key);
  final ImageController imageController = Get.find<ImageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () => ProfileImageBottomSheet.showPanel(context),
                child: Obx(() => imageController.imagePath.value.isEmpty
                    ? Image.asset(
                        AppImages.defaultProfilePicture,
                        height: 294.h,
                        width: 294.w,
                      )
                    : Image.file(
                  File(imageController.imagePath.value),
                  height: 294.h,
                  width: 294.w,
                )),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Upload Profile Picture",style: TextStyle(fontSize: 20,color: Colors.amber),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              CustomButton(
                  function: () => onDone(),
                  buttonText: "Next",
                  buttonColor: Colors.white,
                  icon: AppImages.doneIcon,
                  textColor: Colors.black)
            ],
          ),
        ),
      ),
    );
  }

  void onDone() {
    Get.find<UserProfileController>().setUserData();
  }
}
