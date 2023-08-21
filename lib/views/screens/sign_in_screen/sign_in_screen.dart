import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_video_chat_app/utils/app_imports.dart';

import 'widgets/custom_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin<SignInScreen> {
  late AnimationController _animationController;
  late Animation<double> _buttonOpacity;
  final AuthController _authController = Get.find<AuthController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    _buttonOpacity =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.background), fit: BoxFit.cover)),
        child: AnimatedBuilder(
          builder: (context, tweenData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: _buttonOpacity.value,

                    child: Column(

                      children: [
                        const Spacer(),
                       /* Image.asset(
                          AppImages.appLogo,
                          height: 110.h,
                          width: 120.w,
                        ),*/
                       /* Text(
                          AppText.appName,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        ),*/
                        Image.asset(
                          AppImages.logoIcon,
                          height: 430.h,
                          width: 354.w,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: _buttonOpacity.value,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Spacer(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                  textColor: Colors.black,
                                  buttonText: "Continue with Google",
                                  function: () =>
                                      _authController.onGoogleSignIn(),
                                  buttonColor: Colors.white,
                                  icon: AppImages.googleIcon),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          animation: _animationController,
        ),
      ),
    );
  }
}
