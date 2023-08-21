import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';
import 'package:url_launcher/url_launcher.dart';

class VerificationDialog{
    static void showDialog() {

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'chzabi197@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Please Attach Your Documents For Verification',
      }),
    );
    Get.dialog(
         Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: AlertDialog(
                    title: const Text('Email Verification'),
                    content: const Text('An email has been sent to your registered email address. Please click the verification link to complete the registration process.'),
                    actions: [

                      TextButton(
                        onPressed: (){
                          LocalStorageService.localStorageInstance.removeSession();
                          AuthServices.authInstance.logout();
                          launchUrl(emailLaunchUri);},
                        child: const Text('Send Email'),
                      ),
                    ],
                  ),
              ),
            ),
        barrierDismissible: false,
        barrierColor: Colors.black12);
  }

  static  String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }
}