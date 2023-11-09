import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/colors.dart';
import 'package:learnez/constants/images.dart';
import 'package:learnez/pages/home/bloc/home_page_bloc.dart';
import 'package:learnez/widgets/app_bar.dart';

import 'bottom_navigation.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      buildWelcomeText(),
                      // SizedBox(height: 10.h),
                      buildSearchView(),
                      _buildSliderView(context, state),
                      buildMenuView(),
                      buildMenuOption(),
                    ],
                  ),
                ),
                buildGridView(),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Container(
        margin: EdgeInsets.only(left: 6.w, right: 6.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: Image.asset(menuIcon),
            ),
            SizedBox(
              width: 20.w,
              height: 20.h,
              child: Image.asset(profileIcon1),
            ),
          ],
        ),
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
            margin: EdgeInsets.only(top: 14.h),
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

  Widget _buildSliderView(BuildContext context, HomePageState state) {
    return Column(
      children: [
        Container(
          width: 325.w,
          height: 160.h,
          margin: EdgeInsets.only(top: 14.h),
          child: PageView(
            onPageChanged: (index) {
              context.read<HomePageBloc>().add(HomePageEvent(index: index));
            },
            children: [
              buildSlideImage(slideImage: sliderArtImage),
              buildSlideImage(slideImage: sliderArtImage1),
              buildSlideImage(slideImage: sliderArtImage2),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 2.h),
          child: DotsIndicator(
            dotsCount: 3,
            position: state.index,
            decorator: DotsDecorator(
              color: AppColors.primaryBg,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildSlideImage({required String slideImage}) {
    return Container(
      width: 325.w,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22.r)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(slideImage),
        ),
      ),
    );
  }

  Widget buildMenuView() {
    return Container(
      width: 325.w,
      margin: EdgeInsets.only(top: 16.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildReusableMenuText(
                menuText: 'Choose your course',
                fontSize: 16.sp,
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),
              buildReusableMenuText(
                menuText: 'View all',
                fontSize: 10.sp,
                color: AppColors.primaryThreeElementText,
                fontWeight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildMenuOption() {
    return Container(
      margin: EdgeInsets.only(top: 14.h),
      child: Row(
        children: [
          buildMenuOptionButton(
            buttonName: 'All',
            backgroundColor: AppColors.primaryElement,
            textColor: AppColors.primaryElementText,
          ),
          buildMenuOptionButton(
            buttonName: 'Popular',
            backgroundColor: AppColors.primaryElementText,
            textColor: AppColors.primaryThreeElementText,
          ),
          buildMenuOptionButton(
            buttonName: 'Newest',
            backgroundColor: AppColors.primaryElementText,
            textColor: AppColors.primaryThreeElementText,
          ),
        ],
      ),
    );
  }

  Widget buildGridView() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 18.h),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.5),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return buildCourseGrid();
          },
          childCount: 4,
        ),
      ),
    );
  }

  Widget buildCourseGrid() {
    return Container(
      padding: EdgeInsets.only(left: 6.h, bottom: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(sliderArtImage2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Best Course for IT',
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 11.sp,
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Top company requirement',
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
              overflow: TextOverflow.fade,
              fontSize: 11.sp,
              color: AppColors.primaryFourElementText,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuOptionButton({
    required String buttonName,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.only(top: 5.w, left: 15.h, right: 15.h, bottom: 5.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(
          color: backgroundColor,
        ),
      ),
      child: buildReusableMenuText(
        menuText: buttonName,
        fontSize: 11.sp,
        color: textColor,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget buildReusableMenuText({
    required String menuText,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return Text(
      menuText,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
