import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/helpers/export_helpers.dart';

void showSnackBar(BuildContext context, String content,
    {bool isError = false}) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: MyTextStyles.normalTextStyle,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: isError
            ? AppColors.redColor.withOpacity(0.30)
            : AppColors.greenColor.withOpacity(0.30),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 25.0.h, left: 24.w, right: 24.w),
      ),
    );
}

Widget showLoadingIndicator() {
  return Lottie.asset(
    AssetHelper.circularAnimation,
    repeat: true,
    fit: BoxFit.fill,
    frameRate: FrameRate(60),
  );
}
