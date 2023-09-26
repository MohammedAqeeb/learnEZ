import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/colors.dart';
import 'package:learnez/constants/images.dart';
import 'package:learnez/pages/home/bloc/home_page_bloc.dart';

import 'widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('data'),
              ),
              body: bottomNavigationItem(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.primarySecondaryElementText,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryFourElementText.withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 2,
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.index,
                  backgroundColor: Colors.white,
                  onTap: (value) => context.read<HomePageBloc>().add(
                        HomePageTriggerEvent(value),
                      ),
                  items: [
                    BottomNavigationBarItem(
                      label: 'Home',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(homeIcon),
                      ),
                      activeIcon: SizedBox(
                        width: 18.w,
                        height: 18.h,
                        child: Image.asset(
                          homeIcon,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Search',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(searchIcon),
                      ),
                      activeIcon: SizedBox(
                        width: 18.w,
                        height: 18.h,
                        child: Image.asset(
                          searchIcon,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'course',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(playcircle1Icon),
                      ),
                      activeIcon: SizedBox(
                        width: 18.w,
                        height: 18.h,
                        child: Image.asset(
                          playcircle1Icon,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'message',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(messageIcon),
                      ),
                      activeIcon: SizedBox(
                        width: 18.w,
                        height: 18.h,
                        child: Image.asset(
                          messageIcon,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'profile',
                      icon: SizedBox(
                        width: 15.w,
                        height: 15.h,
                        child: Image.asset(profileIcon),
                      ),
                      activeIcon: SizedBox(
                        width: 18.w,
                        height: 18.h,
                        child: Image.asset(
                          profileIcon,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
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
