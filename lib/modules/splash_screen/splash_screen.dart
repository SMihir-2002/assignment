import 'package:assignment/constants/colors.dart';
import 'package:assignment/modules/home/home_screen.dart';
import 'package:assignment/modules/login/login_screen.dart';
import 'package:assignment/modules/splash_screen/widgets/splash_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  changeScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    GetStorage _storage = GetStorage();

    if (_storage.read("isUserPresent") == true) {
      Get.offAll(() =>  HomeScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    changeScreen();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [AppLogo(), SizedBox(height: 20.h,),SpinKitChasingDots(color: titleFontColor,)],
        ),
      ),
    );
  }
}
