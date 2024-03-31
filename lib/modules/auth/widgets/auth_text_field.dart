import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.onbscureText,
    required this.isFocused,
    required this.focusNode, required this.iconData,
  });

  final TextEditingController controller;
  final String labelText;
  final bool onbscureText;
  final bool isFocused;
  final FocusNode focusNode;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: isFocused ? 6 : 0,
      child: Container(
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
        height: 60.h,
        width: 350.w,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:8.w),
          child: TextField(
            
            focusNode: focusNode,
            controller: controller,
            obscureText: onbscureText,
            decoration: InputDecoration(
              
              labelText: labelText,
              icon: Icon(iconData,color: primaryFontColor,),
              labelStyle:
                  fNote,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}
