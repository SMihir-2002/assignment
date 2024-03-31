import 'package:assignment/constants/colors.dart';
import 'package:assignment/modules/home/home_screen.dart';
import 'package:assignment/modules/auth/login_screen.dart';
import 'package:assignment/modules/onboarding/onboarding_screen.dart';
import 'package:assignment/modules/splash_screen/widgets/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  changeScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAll(() => OnboardingScreen());
  }

  @override
  Widget build(BuildContext context) {
    changeScreen();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(),
            SizedBox(
              height: 20.h,
            ),
            SpinKitChasingDots(
              color: titleFontColor,
            )
          ],
        ),
      ),
    );
  }
}
