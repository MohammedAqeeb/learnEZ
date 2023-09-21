import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learnez/constants/colors.dart';

toastWidget({
  required String msg,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: AppColors.primaryBg,
    fontSize: 12.sp,
    gravity: ToastGravity.TOP,
    textColor: AppColors.primaryBackground,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 5,
  );
}
