import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/colors.dart';
import 'package:learnez/constants/images.dart';
import 'package:learnez/pages/welcome/bloc/welcome_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(
                top: 25.h,
              ),
              width: 375.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      buildPages(
                        index: 1,
                        image: onBoardImage1,
                        subtitle:
                            'Empowering Your Learning Journey with a World of Knowledge and Opportunities',
                        title: 'Welcome to LearnEZ',
                        buttonText: 'Next',
                      ),
                      buildPages(
                        index: 2,
                        image: onBoardImage2,
                        subtitle:
                            'Unlock a Wealth of Knowledge and Expand Your Horizons with LearnEZ"',
                        title: 'Discover New Horizons',
                        buttonText: 'Next',
                      ),
                      buildPages(
                        index: 3,
                        image: onBoardImage3,
                        title: 'Elevate Your Learning',
                        subtitle:
                            'Embark on Your Journey to Educational Excellence and Personal Growth with LearnEZ',
                        buttonText: 'Get Started',
                      ),
                    ],
                  ),
                  Positioned( 
                    bottom: 70.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        activeColor: Colors.black,
                        color: Colors.grey,
                        activeSize: Size(10.w, 10.h),
                        size: const Size.square(8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildPages({
    required int index,
    required String image,
    required String title,
    required String subtitle,
    required buttonText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          SizedBox(
            width: 340.w,
            height: 340.h,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primaryThreeElementText,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (index < 3) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 2),
                  curve: Curves.easeInExpo,
                );
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  'signIn',
                  (route) => false,
                );
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                top: 70.h,
              ),
              width: 325.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: AppColors.primaryText,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
                // boxShadow: const [
                //   BoxShadow(
                //     blurRadius: 1,
                //     spreadRadius: 2,
                //     offset: Offset(2, 3),
                //     color: AppColors.primaryFourElementText,
                //   ),
                // ],
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style:   TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
