import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:assignment/modules/main_screen/main_screen.dart';
import 'package:assignment/modules/auth/signup_screen.dart';
import 'package:assignment/modules/auth/widgets/auth_text_field.dart';
import 'package:assignment/modules/auth/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  RxBool showPasswordField = false.obs;
  RxBool showcontinueButton = false.obs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  RxBool isEmailFocused = false.obs;
  RxBool isPasswordFocused = false.obs;

  @override
  Widget build(BuildContext context) {
    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) {
        isEmailFocused.value = true;
      } else {
        isEmailFocused.value = false;
      }
    });
    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasFocus) {
        isPasswordFocused.value = true;
      } else {
        isPasswordFocused.value = false;
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: SizedBox(
                width: 350.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 1),
                    Text(
                      "Welcome Back!",
                      style: fTitle2,
                    ),
                    Text(
                      "Please Sign in to Continue",
                      style: fNote,
                    ),
                    const Spacer(flex: 1),
                    Obx(
                      () => AuthTextField(
                        controller: _emailController,
                        labelText: "EMAIL",
                        onbscureText: false,
                        isFocused: isEmailFocused.value,
                        focusNode: _emailFocusNode,
                        iconData: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(
                      () => AuthTextField(
                        controller: _passwordController,
                        labelText: "PASSWORD",
                        onbscureText: true,
                        isFocused: isPasswordFocused.value,
                        focusNode: _passwordFocusNode,
                        iconData: Icons.key,
                      ),
                    ),
                    const Spacer(flex: 1),
                    SizedBox(
                      height: 14.h,
                    ),
                    const Spacer(flex: 1),
                    Center(
                      child: Row(
                        children: [
                          const Spacer(),
                          PrimaryButton2(
                            onPressed: () {
                              Get.offAll(() => MainScreen());
                            },
                            text: "Login",
                            showIcon: true,
                            icn: Icons.arrow_forward_rounded,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account?",
                          style: fNote.copyWith(color: primaryFontColor),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(() => SignUpScreen());
                            },
                            child: Text("Sign Up",
                                style:
                                    fNote.copyWith(color: Colors.orangeAccent)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.13, -1.1),
            child: Image.asset(
              "assets/images/authScreenWidget.png",
              height: 150.h,
            ),
          ),
        ],
      ),
    );
  }
}
