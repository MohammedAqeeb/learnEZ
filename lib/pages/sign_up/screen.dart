import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/images.dart';
import 'package:learnez/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:learnez/pages/sign_up/logic.dart';

import '../../widgets/app_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar('Sign Up'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 32.h),
                  child: Center(
                    child: buildResusableText('Enter your details to sign up'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 36.h, left: 18.w, right: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildResusableText('User Name'),
                      SizedBox(height: 10.h),
                      buildTextField(
                        'Enter Your name',
                        'email',
                        userIcon,
                        (name) {
                          context
                              .read<SignUpBloc>()
                              .add(SignUpUserNameEvent(userName: name));
                        },
                      ),
                      SizedBox(height: 14.h),
                      buildResusableText('Email'),
                      SizedBox(height: 10.h),
                      buildTextField(
                        'Enter Your Email Address',
                        'email',
                        userIcon,
                        (email) => context
                            .read<SignUpBloc>()
                            .add(SignUpUserEmailEvent(email: email)),
                      ),
                      SizedBox(height: 14.h),
                      buildResusableText('Password'),
                      SizedBox(height: 10.h),
                      buildTextField(
                        'Enter Your Password',
                        'password',
                        lockIcon,
                        (password) {
                          context
                              .read<SignUpBloc>()
                              .add(SignUpUserPasswordEvent(password: password));
                        },
                      ),
                      SizedBox(height: 10.h),
                      buildResusableText('Confirm Password'),
                      SizedBox(height: 10.h),
                      buildTextField(
                        'Confirm Password',
                        'password',
                        lockIcon,
                        (confirm) {
                          context.read<SignUpBloc>().add(
                              SignUpUserConfirmPasswordEvent(
                                  confirePassword: confirm));
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12.h),
                        child: Center(
                          child: buildResusableText(
                            'By creating account you agree with our terms & conditions',
                          ),
                        ),
                      ),
                      buildLoginButton('Sign Up', 'login', () {
                        SignUpLogic(context: context).createUser();
                      }),
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
