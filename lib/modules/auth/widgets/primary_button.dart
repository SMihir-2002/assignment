import 'package:assignment/constants/text_styles.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onPressed,
      child: ClayContainer(
        surfaceColor: Colors.blue,
        borderRadius: 14.r,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
          child: Text(
            text,
            style: fSubHeading3.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class PrimaryButton2 extends StatelessWidget {
  const PrimaryButton2(
      {super.key, required this.onPressed, required this.text, required this.showIcon, required this.icn});

  final VoidCallback onPressed;
  final String text;
  final bool showIcon;
  final IconData icn;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(100),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.h),
              gradient: LinearGradient(colors: [
                Colors.orange.shade500,
                Colors.orange.shade400,
                Colors.orange.shade100
              ])),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
            child: UnconstrainedBox(
              child: Row(
                children: [
                  Text(
                    text,
                    style: fSubHeading3.copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 8.h,),
                  showIcon?Icon(icn, color:Colors.white ,):const SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
