import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase/controllers/controllers/authController.dart';
import 'package:getx_firebase/screen/login_Signup/loginScreen.dart';
import 'package:getx_firebase/screen/login_Signup/signupScreen.dart';
import 'package:sizer/sizer.dart';

import '../homeScreenControl/homeScreen_Control.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F0EA),
      body: GetBuilder<SplashScreenViewModel>(
        init: SplashScreenViewModel(),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    width: controller.animation.value * 40.w,
                    height: controller.animation.value * 40.w,
                  ),
                  SizedBox(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Plant Shop',
                          textStyle: const TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Comfortaa',
                          ),
                          colors: [
                            const Color(0xFF215528),
                            const Color(0xFF64976C),
                            const Color(0xFF397241),
                          ],
                          speed: const Duration(seconds: 1)
                        ),
                      ],
                     // isRepeatingAnimation: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class SplashScreenViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  AuthController authController = Get.find<AuthController>();

  @override
  void onInit() {
    animationInitilization();
    Timer(
        const Duration(seconds: 4),
        () => authController.user != null
            ? Get.off(
                const HomeScreenControll(),
         // LoginScreen()
              )
            : Get.off(const LoginScreen()));
    super.onInit();
  }

  animationInitilization() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }
}
