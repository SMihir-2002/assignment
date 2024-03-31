import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.index,
    required this.onPressed1,
    required this.onPressed2,
    required this.onPressed3,
    required this.onPressed0,
  });
  final int index;
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final VoidCallback onPressed3;
  final VoidCallback onPressed0;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2000.h),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            color: titleFontColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavBarItems(
              isSelected: index == 0,
              icn: Icons.home,
              label: 'Home',
              onpressed: onPressed0,
            ),
            NavBarItems(
              isSelected: index == 1,
              icn: Icons.menu_book_sharp,
              label: 'Docs',
              onpressed: onPressed1,
            ),
            NavBarItems(
              isSelected: index == 2,
              icn: Icons.shopping_cart_outlined,
              label: 'Excahnage',
              onpressed: onPressed2,
            ),
            NavBarItems(
              isSelected: index == 3,
              icn: Icons.supervisor_account_rounded,
              label: 'Service',
              onpressed: onPressed3,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarItems extends StatelessWidget {
  const NavBarItems(
      {super.key,
      required this.isSelected,
      required this.icn,
      required this.label,
      required this.onpressed});
  final bool isSelected;
  final IconData icn;
  final String label;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onpressed,
      child: UnconstrainedBox(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color:
                isSelected ? Colors.pink.withOpacity(0.2) : Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icn,
                size: isSelected ? 18.h : 16.h,
                color: isSelected ? Colors.white : Colors.grey,
              ),
              Text(
                label,
                style: isSelected ? fNavBarSelected : fNavBar,
              )
            ],
          ),
        ),
      ),
    );
  }
}
