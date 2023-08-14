import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/constants/export_constants.dart';

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
