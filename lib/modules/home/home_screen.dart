
import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:assignment/modules/home/widgets/profile_completion_widget.dart';
import 'package:assignment/modules/home/widgets/recent_applications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String name = "";
  String email = "";
  String contact = "";
  String location = "";
  String joinedAt = "";

  RxBool isLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ACompleteProfile(),
        SizedBox(
          height: 8.h,
        ),
        const RecentApplications(),
        SizedBox(
          height: 8.h,
        ),
        Text(
            "Opportunities For You",
            style: fSubHeading2,
          ),
          SizedBox(
            height: 8.h,
          ),
        ...List.generate(25, (index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 6.h ),
          child: Material(
            shadowColor: Colors.blueGrey.withOpacity(0.4),
                      elevation: 4,
                      borderRadius: BorderRadius.circular(14.r),
            child: Container(
              width: double.infinity,
              height: 140.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: Colors.grey.withOpacity(0.3))
              ),
            
              padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w ),
              child: Container(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                                padding: EdgeInsets.symmetric(vertical: 3.h),
                                height: 70.h,
                                width: 70.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.3))),
                                child: Image.asset(
                                  "assets/images/appleLogo.png",
                                ),
                              ),
                               Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.h, horizontal: 12.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Colors.blue)),
                            child: Text(
                              "Quick Apply",
                              style: fNote.copyWith(
                                  fontSize: 10.h, color: Colors.blue),
                            ),
                          )
                      ],
                    ),
                    SizedBox(width: 6.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("SDE-1", style: fSubHeading2.copyWith(fontSize: 14.sp),),
                        Text("Apple Inc", style: fSubHeading3.copyWith(fontSize: 12.sp),),
                        Text("Location :- California USA", style: fNote.copyWith(fontSize: 10.sp),),
                        Text("CTC:- 5.8LPA - 10LPA ", style: fNote.copyWith(fontSize: 10.sp, color: titleFontColor),),
                        Flexible(child: Text("Skills Required: - Java, SpringBoot , Flutter, React ....",style: fNote.copyWith(fontSize: 10.sp,), overflow: TextOverflow.ellipsis,)), 
                        SizedBox()
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}
