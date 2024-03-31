
import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentApplications extends StatelessWidget {
  const RecentApplications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Applications",
            style: fSubHeading2,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 190.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(15, (index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 10.h),
                  child: Material(
                    shadowColor: Colors.blueGrey.withOpacity(0.4),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(14.r),
                    child: Container(
                      height: 180.h,
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      width: 120.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.1))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3.h),
                            height: 50.h,
                            width: 54.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3))),
                            child: Image.asset(
                              "assets/images/appleLogo.png",
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 3.h),
                            height: 45.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Apple Inc",
                                  style: fNote.copyWith(color: titleFontColor),
                                ),
                                Text(
                                  "Status :- ${index % 2 == 0 ? 'Viewed' : 'Submitted'}",
                                  style: fNote.copyWith(fontSize: 10.h),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.h, horizontal: 12.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Colors.blue)),
                            child: Text(
                              "View Job",
                              style: fNote.copyWith(
                                  fontSize: 10.h, color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
