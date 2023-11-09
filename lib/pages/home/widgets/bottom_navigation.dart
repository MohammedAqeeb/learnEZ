import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/colors.dart';
import 'package:learnez/pages/home/widgets/home_page_screen.dart';
import 'package:learnez/pages/profile/profile_screen.dart';

Widget bottomNavigationItem(int index) {
  List<Widget> widgets = [
    const HomePageScreen(),
    const Center(
      child: Text('SEARCH SCREEN'),
    ),
    const Center(
      child: Text('COURSE SCREEN'),
    ),
    const Center(
      child: Text('CHAT SCREEN'),
    ),
    const ProfileScreen(),
  ];

  return widgets[index];
}

Widget buildWelcomeText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Text(
          'Welcome',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryThreeElementText,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 2.w),
        child: Text(
          'MOHAMMED AQEEB',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
      ),
    ],
  );
}
