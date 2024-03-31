import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:assignment/modules/main_screen/widgets/bottom_nav_bar.dart';
import 'package:assignment/modules/home/home_screen.dart';
import 'package:assignment/modules/screen2/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  RxInt bottomNavBarValue = 0.obs;
  List screens = [
    HomeScreen(),
    const Screen2(),
    const Screen2(),
    const Screen2(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        title: Obx(
          () => bottomNavBarValue.value==0?Container(
            
            height: 60.h,
            margin: EdgeInsets.only(bottom: 10.h),
            width: double.infinity,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.h,
                  backgroundColor: Colors.greenAccent,
                  child: Icon(
                    Icons.person,
                    color: primaryFontColor,
                    size: 22.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name of User", style: fNavBarSelected.copyWith(color: primaryFontColor, fontSize: 14.sp),),
                    Text("Lorem ipsum", style: fNote.copyWith(fontSize: 12.sp),),
                  ],
                ),
                Spacer(),
                Icon(Icons.message, size: 20.h,)
              ],
            ),
          ):const SizedBox(),
        ),
      ),
      bottomNavigationBar: Obx(() => CustomBottomNavBar(
            index: bottomNavBarValue.value,
            onPressed0: () {
              bottomNavBarValue.value = 0;
            },
            onPressed1: () {
              bottomNavBarValue.value = 1;
            },
            onPressed2: () {
              bottomNavBarValue.value = 2;
            },
            onPressed3: () {
              bottomNavBarValue.value = 3;
            },
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Obx(
            () {
              return PageStorage(
                  bucket: pageStorageBucket,
                  child: screens[bottomNavBarValue.value]);
            },
          ),
        ),
      ),
    );
  }
}
