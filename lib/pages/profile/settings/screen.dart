import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnez/constants/colors.dart';
import 'package:learnez/constants/constant.dart';
import 'package:learnez/constants/global.dart';
import 'package:learnez/constants/images.dart';
import 'package:learnez/widgets/app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar('Settings'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => showAlert(context),
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              height: 80.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(logoutIcon),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Confirm Logout',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.primaryText,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryElementBg,
                    )),
              ),
              TextButton(
                onPressed: () {
                  Global.storageService.removeKey(Constant.userId);
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'signIn', (route) => false);
                },
                child: Text('Confirms',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryElementStatus,
                    )),
              ),
            ],
          );
        });
  }
}
