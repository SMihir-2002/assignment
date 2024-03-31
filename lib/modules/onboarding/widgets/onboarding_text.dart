import 'package:assignment/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class OnboardingText extends StatelessWidget {
  const OnboardingText({
    super.key,
    required this.onbText,
  });

  final String onbText;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Text(
        onbText,
        style: fSubHeading2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
