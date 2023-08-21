import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';

class ProfileImageBottomSheet{

 static void showPanel(BuildContext context) {
    showModalBottomSheet(
        context: context,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: [
                ListTile(
                  onTap: ()async {
                    Get.find<ImageController>().getImageFromCamera();
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                  ),
                  title: const Text(
                    "Take a picture",

                  ),
                ),
                ListTile(
                  onTap: () async{
                    Get.find<ImageController>().getImageFromGallery();

                  },
                  leading: const Icon(
                    Icons.panorama_horizontal_select,
                  ),
                  title: const Text(
                    "Choose image from gallery",

                  ),
                ),
              ],
            ),
          );
        });
  }
}