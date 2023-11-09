import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/colors.dart';
import 'package:learnez/constants/images.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset(menuIcon),
        ),
        Text(
          'Profile',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 18.w,
          height: 18.h,
          child: Image.asset(moreVertical),
        ),
      ],
    ),
  );
}

Widget userName() {
  return Container(
    margin: EdgeInsets.only(top: 4.h),
    child: Text(
      'Mr White',
      style: TextStyle(
        color: AppColors.primarySecondaryElementText,
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildProfileAndIcon() {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(right: 6.w),
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(top: 20.h),
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(profileImg),
          ),
        ),
        child: Image(
          width: 25.w,
          height: 25.h,
          image: const AssetImage(editIcon),
        ),
      ),
      userName(),
    ],
  );
}

Widget buildProfileOptions({
  required String buttonName,
  required String image,
  required Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(top: 22.h, left: 22.h, bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 35.w,
            height: 30.h,
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                // fit: BoxFit.fill,
                image: AssetImage(image),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            buttonName,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
