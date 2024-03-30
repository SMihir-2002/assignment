import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';






class ProfileTextField extends StatelessWidget {
  const ProfileTextField(
      {super.key,
      required this.icn,
      required this.controller,
      required this.label,
      required this.isEnabled});
  final IconData icn;
  final TextEditingController controller;
  final bool isEnabled;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icn,
          size: 26.h,
          color: Colors.green,
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
          height: 46.h,
          width: 278.w,
          child: TextField(
            style: FTextField1,
            controller: controller,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.2.h)),
              labelText: label,
              enabled: isEnabled,
              labelStyle:
                  GoogleFonts.inter(fontSize: 14.h, color: titleFontColor),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.h)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.2.h)),
            ),
          ),
        ),
      ],
    );
  }
}
