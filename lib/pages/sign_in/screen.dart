import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/pages/sign_in/widgets/app_bar.dart';

import '../../constants/images.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSocialMediaIcon(context),
                Center(
                    child: buildResusableText(
                        'Or use your email account to login')),
                Container(
                  padding: EdgeInsets.only(top: 36.h, left: 18.w, right: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildResusableText('Email'),
                      SizedBox(height: 10.h),
                      buildTextField(
                          'Enter Your Email Address', 'email', userIcon),
                      SizedBox(height: 14.h),
                      buildResusableText('Password'),
                      SizedBox(height: 10.h),
                      buildTextField(
                          'Enter Your Password', 'password', lockIcon),
                      buildForgetPasswordButton(),
                      buildLoginButton('Log In', 'login'),
                      buildLoginButton('Sign Up', 'register'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}
