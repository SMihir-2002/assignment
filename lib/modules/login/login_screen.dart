import 'package:assignment/constants/text_styles.dart';
import 'package:assignment/modules/login/widgets/auth_text_field.dart';
import 'package:assignment/modules/login/widgets/primary_button.dart';
import 'package:assignment/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  RxBool showPasswordField = false.obs;
  RxBool showcontinueButton = false.obs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _emailController.addListener(
      () {
        _passwordController.clear();

        if (showPasswordField.value) {
          showPasswordField.value = false;
        }
        if (_emailController.text != "" && !showcontinueButton.value) {
          showcontinueButton.value = true;
        } else if (_emailController.text == "") {
          showcontinueButton.value = false;
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 350.w,
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 1),
                  Text(
                    "Let's Login \nFirst 👍",
                    style: fTitle2,
                  ),
                  const Spacer(flex: 1),
                  AuthTextField(
                    controller: _emailController,
                    labelText: "E-mail",
                    onbscureText: false,
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  showPasswordField.value
                      ? AuthTextField(
                          controller: _passwordController,
                          labelText: "Password",
                          onbscureText: true,
                        )
                      : const SizedBox(),
                  const Spacer(flex: 1),
                  SizedBox(
                    height: 14.h,
                  ),
                  const Spacer(flex: 1),
                  showcontinueButton.value
                      ? Center(
                          child: PrimaryButton(
                              onPressed: () {
                                if (!showPasswordField.value) {
                                  showPasswordField.value = true;
                                } else {
                                  AppFirebaseServices()
                                      .loginWitheEmailandPassword(
                                          email: _emailController.text,
                                          password: _passwordController.text, context: context);
                                }
                              },
                              text: showPasswordField.value
                                  ? "          Login          "
                                  : "     Continue     "),
                        )
                      : const SizedBox(),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
