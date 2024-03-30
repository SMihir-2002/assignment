import 'package:assignment/constants/text_styles.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      borderRadius: 4000,
      height: 300.h,
      width: 300.h,
      depth: 20,
      child: Center(
        child: Text(
          "(LOGO)",
          style: fTitle,
        ),
      ),
    );
  }
}
