import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/pages/sign_in/bloc/signin_bloc.dart';
import 'package:learnez/pages/sign_in/controller.dart';
import 'package:learnez/widgets/app_bar.dart';

import '../../constants/images.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Sign In'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSocialMediaIcon(context),
                    Center(
                        child: buildResusableText(
                            'Or use your email account to login')),
                    Container(
                      padding:
                          EdgeInsets.only(top: 36.h, left: 18.w, right: 18.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildResusableText('Email'),
                          SizedBox(height: 10.h),
                          buildTextField(
                            'Enter Your Email Address',
                            'email',
                            userIcon,
                            (email) {
                              context
                                  .read<SigninBloc>()
                                  .add(SignInEmailEvent(email: email));
                            },
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
                                  .read<SigninBloc>()
                                  .add(SignInPasswordEvent(password: password));
                            },
                          ),
                          buildForgetPasswordButton(),
                          buildLoginButton('Log In', 'login', () {
                            SignInController(context: context)
                                .handleSignIn('email');
                          }),
                          buildLoginButton('Sign Up', 'register', () {
                            Navigator.of(context).pushNamed('signUp');
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
      },
    );
  }
}
