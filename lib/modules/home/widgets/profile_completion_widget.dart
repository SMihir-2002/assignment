import 'dart:math';

import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ACompleteProfile extends StatelessWidget {
  const ACompleteProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      
      borderRadius: 16.r,
      color: primaryBgColor,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
          child: Row(
            children: [
               const ProfileCompletionStatusCircularIndicator(
                      precentage: 76,
                    ),
              SizedBox(
                width: 16.w,
              ),
              Flexible(
                child: Text("Completing profiles significantly enhances the chances of getting hired.",
                    style: fSubHeading3),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18.h,
                color: primaryFontColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}



class ProfileCompletionStatusCircularIndicator extends StatelessWidget {
  final int precentage;
  const ProfileCompletionStatusCircularIndicator({super.key, required this.precentage,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClayContainer(
          
          spread: 2.sp,
          width: 57.h,
          height: 57.h,

          borderRadius: 200,
          depth: 20,
          child:Container(width: 55.h,
          height: 55.h,
            decoration: BoxDecoration(shape: BoxShape.circle,
            
            ),
          )
          
        ),
        ClayContainer(
        
          spread: 2.sp,
          width: 44.h,
          height: 44.h,
          borderRadius: 200,
          depth: -20,
          curveType: CurveType.convex,
          child: 
          CustomPaint(
            painter: CircularPercentageProgressIndicatorPainter(0.6,),
          ),
          
        ),
        ClayContainer(
         
          spread: 2.sp,
          width: 22.2.h,
          height: 22.2.h,
          borderRadius: 200,
          depth: 20,
          curveType: CurveType.concave,
          child:Container(width: 55.h,
          height: 55.h,
            decoration: BoxDecoration(shape: BoxShape.circle,
            ),
          )
        ),
        ClayContainer(
         
          spread: 2.sp,
          width: 18.9.h,
          height: 18.9.h,
          borderRadius: 200,
          depth: 30,
          curveType: CurveType.convex,
          child: Center(
            child: Text(
              "60%",
              style: fSubHeading3.copyWith(fontSize: 6.sp)
          ),

        )
    )],
    );
  }
}





class CircularPercentageProgressIndicatorPainter extends CustomPainter {
  final double sliderValue;

  CircularPercentageProgressIndicatorPainter(this.sliderValue);

  @override
  void paint(Canvas canvas, Size size) {
     double strokeWidth = 9.h;
    final double radius = (size.shortestSide - strokeWidth) / 2;

    final Paint paint = Paint()
      ..shader =  LinearGradient(
        colors: [Colors.orange.shade500, Colors.orange.shade100],
      ).createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: radius),
      -pi / 2, // Start angle (top)
      2 * pi * sliderValue, // Sweep angle based on the slider value
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}



class CircularPercentageProgressIndicatorPainter2 extends CustomPainter {
  final double sliderValue;

  CircularPercentageProgressIndicatorPainter2(this.sliderValue);

  @override
  void paint(Canvas canvas, Size size) {
     double strokeWidth = 5.h;
    final double radius = (size.shortestSide - strokeWidth) / 2;

    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF50CAFF), Color(0xFF0478FF)],
      ).createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: radius),
      -pi / 2, // Start angle (top)
      2 * pi * sliderValue, // Sweep angle based on the slider value
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
