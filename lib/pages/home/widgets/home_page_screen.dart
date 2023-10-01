import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/colors.dart';
import 'package:learnez/constants/images.dart';
import 'package:learnez/widgets/app_bar.dart';

import 'bottom_navigation.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildWelcomeText(),
          SizedBox(height: 14.h),
          buildSearchView(),
        ],
      ),
    );
  }

  Widget buildSearchView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            margin: EdgeInsets.only(top: 16.h),
            child: buildTextField(
              'Search For Course',
              'search',
              searchIcon2,
              (String val) {},
            ),
          ),
        ),
      ],
    );
  }
}
