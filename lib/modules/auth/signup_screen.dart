import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:assignment/modules/main_screen/main_screen.dart';
import 'package:assignment/modules/auth/login_screen.dart';
import 'package:assignment/modules/auth/widgets/auth_text_field.dart';
import 'package:assignment/modules/auth/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  RxBool showPasswordField = false.obs;
  RxBool showcontinueButton = false.obs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  RxBool isEmailFocused = false.obs;
  RxBool isPasswordFocused = false.obs;
  RxBool isconfirmPasswordFocused = false.obs;
  RxBool isNameFocused = false.obs;
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
    _nameFocusNode.addListener(() {
      if (_nameFocusNode.hasFocus) {
        isNameFocused.value = true;
      } else {
        isNameFocused.value = false;
      }
    });
    _confirmPasswordFocusNode.addListener(() {
      if (_confirmPasswordFocusNode.hasFocus) {
        isconfirmPasswordFocused.value = true;
      } else {
        isconfirmPasswordFocused.value = false;
      }
    });

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: SizedBox(
                width: 350.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 1),
                    Text(
                      "Create Account",
                      style: fTitle2,
                    ),
                    
                    const Spacer(flex: 1),
                    Obx(
                      () => AuthTextField(
                        controller: _nameController,
                        labelText: "Name",
                        onbscureText: false,
                        isFocused: isNameFocused.value,
                        focusNode: _nameFocusNode,
                        iconData: Icons.person,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(
                      () => AuthTextField(
                        controller: _emailController,
                        labelText: "Email",
                        onbscureText: true,
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
                        labelText: "Password",
                        onbscureText: false,
                        isFocused: isPasswordFocused.value,
                        focusNode: _passwordFocusNode,
                        iconData: Icons.key_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(
                      () => AuthTextField(
                        controller: _confirmPasswordController,
                        labelText: "Confirm Password",
                        onbscureText: true,
                        isFocused: isconfirmPasswordFocused.value,
                        focusNode: _confirmPasswordFocusNode,
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
                            text: "Sign Up",
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
                          "Already Registered with us?",
                          style: fNote.copyWith(color: primaryFontColor),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.offAll(() => LoginScreen());
                            },
                            child: Text("Sign In",
                                style: fNote.copyWith(color: Colors.orangeAccent)))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(alignment:  Alignment(1.13,-1.1),child: Image.asset("assets/images/authScreenWidget.png", height: 150.h,),),
      ],
    );
  }
}
