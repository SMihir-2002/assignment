import 'package:assignment/modules/auth/login_screen.dart';
import 'package:assignment/modules/auth/widgets/primary_button.dart';
import 'package:assignment/modules/onboarding/widgets/onboarding_image.dart';
import 'package:assignment/modules/onboarding/widgets/onboarding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  RxInt index = 0.obs;

  List imgPaths = [
    "assets/images/onb1.png",
    "assets/images/onb2.png",
    "assets/images/onb3.png",
  ];

  List onbTexts = [
    "A streamlined platform for sourcing top talent.",
    "Endorsed jobs by experts.",
    "Access personalized insights and forge valuable connections within your professional network."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnboardingImage(imgPath: imgPaths[index.value]),
              OnboardingText(onbText: onbTexts[index.value]),
              PrimaryButton(
                onPressed: () async {
                  if (index.value < 2) {
                    index.value++;
                  } else {
                    await GetStorage().write("isOnbordingDone", true);
                    Get.to(() => LoginScreen());
                  }
                },
                text: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
