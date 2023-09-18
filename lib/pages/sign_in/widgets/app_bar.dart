import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/colors.dart';
import 'package:learnez/constants/images.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      'Log In',
      style: TextStyle(
        fontSize: 16.sp,
        color: AppColors.primaryText,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 0.8,
      ),
    ),
  );
}

Widget buildSocialMediaIcon(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 18.h, bottom: 32.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildResusableIcons(googleIcon),
        buildResusableIcons(appleIcon),
        buildResusableIcons(facebookIcon),
      ],
    ),
  );
}

GestureDetector buildResusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset(
        iconName,
      ),
    ),
  );
}

Widget buildResusableText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: Colors.grey.withOpacity(0.5),
    ),
  );
}

Widget buildTextField(String hintText, String textInputType, String iconName) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(18.w),
      ),
      border: Border.all(
        color: AppColors.primaryFourElementText,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          margin: EdgeInsets.only(left: 16.h),
          child: Image.asset(iconName),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.primaryFourElementText,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 14.sp,
            ),
            obscureText: textInputType == 'password' ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget buildLoginButton(
  String buttonName,
  String buttonType,
) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(top: buttonType == 'login' ? 60.h : 20.h),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType == 'login' ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: buttonType == 'login' ? Colors.transparent : Colors.black,
          ),
          borderRadius: BorderRadius.circular(16.w),
        ),
      ),
      onPressed: () {},
      child: Text(
        buttonName,
        style: TextStyle(
          color: buttonType == 'login' ? Colors.white : AppColors.primaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

Padding buildForgetPasswordButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: TextButton(
      onPressed: () {},
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          fontSize: 12.sp,
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryBg,
        ),
      ),
    ),
  );
}
