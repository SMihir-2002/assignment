import 'package:assignment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText, required this.onbscureText,
  });

  final TextEditingController controller;
  final String labelText;
  final bool onbscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 350.w,
      child: TextField(
        controller: controller,
        obscureText:onbscureText ,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: GoogleFonts.inter(fontSize: 16.h, color: titleFontColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2.h)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.2.h)),
        ),
      ),
    );
  }
}
