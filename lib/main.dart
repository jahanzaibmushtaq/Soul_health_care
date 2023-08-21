import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:random_video_chat_app/const/app_fonts.dart';

import 'package:random_video_chat_app/utils/app_routes.dart';
import 'package:random_video_chat_app/views/screens/user_profile/widget/custom_drawer_dashboard.dart';

import 'utils/app_imports.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)=>GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppText.appName,
        theme: ThemeData(fontFamily: AppFonts.openSansSemiBold),
        getPages: AppRoutes.pages,
        initialRoute: AppScreen.initialScreen,
      ),
    );
  }
}
