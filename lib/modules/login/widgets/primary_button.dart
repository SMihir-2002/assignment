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
