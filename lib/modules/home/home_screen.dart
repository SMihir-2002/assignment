import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:assignment/modules/login/login_screen.dart';
import 'package:assignment/modules/login/widgets/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String name = "";
  String email = "";
  String contact = "";
  String location = "";
  String joinedAt = "";

  RxBool isLoading = true.obs;

  getData() async {
    isLoading.value = true;
    try {
      GetStorage _storage = GetStorage();
      Map userDetais = _storage.read("UserDetails");
      name = userDetais["name"];
      email = userDetais["email"];
      location = userDetais["location"];
      contact = userDetais["mobile_number"];
      joinedAt = userDetais["created_at"].toString();
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => isLoading.value
            ? Center(
                child: SpinKitChasingDots(
                  color: titleFontColor,
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.h,
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: 30.h,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "User Name :-",
                      style: fSubHeading2,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      name,
                      style: fSubHeading3,
                    ),
                    Partition(),
                    Text(
                      "Email :-",
                      style: fSubHeading2,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      email,
                      style: fSubHeading3,
                    ),
                    Partition(),
                    Text(
                      "Mobile :-",
                      style: fSubHeading2,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      contact,
                      style: fSubHeading3,
                    ),
                    Partition(),
                    Text(
                      "Current Location:-",
                      style: fSubHeading2,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      location,
                      style: fSubHeading3,
                    ),
                    Partition(),
                    Text(
                      "Joined At",
                      style: fSubHeading2,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      joinedAt,
                      style: fSubHeading3,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: PrimaryButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut().whenComplete(() {
                              GetStorage().erase();
                              Get.offAll(() => LoginScreen());
                            });
                          },
                          text: "      Logout      "),
                    )
                  ],
                ),
              ),
      )),
    );
  }
}

class Partition extends StatelessWidget {
  const Partition({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      height: 2.h,
      width: double.infinity,
      color: Colors.grey,
    );
  }
}
