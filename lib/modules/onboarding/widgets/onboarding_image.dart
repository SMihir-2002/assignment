
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnboardingImage extends StatelessWidget {
  const OnboardingImage({
    super.key,
    required this.imgPath,
  });

  final String imgPath;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      padding: EdgeInsets.all(30.h),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.lightGreenAccent.withOpacity(0.6),
          border: Border.all(color: Colors.lightGreenAccent)),
      child: Image.asset(
        imgPath,
        width: 280.w,
      ),
    );
  }
}
