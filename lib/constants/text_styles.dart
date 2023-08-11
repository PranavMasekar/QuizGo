import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/helpers/export_helpers.dart';

import 'export_constants.dart';

class MyTextStyles {
  static TextStyle get thinTextStyle => TextStyle(
        fontSize: 10.sp,
        fontFamily: AssetHelper.fontFamily,
        color: AppColors.textColor,
        fontWeight: FontWeight.w300,
        overflow: TextOverflow.ellipsis,
      );
  static TextStyle get smallTextStyle => TextStyle(
        fontSize: 12.sp,
        fontFamily: AssetHelper.fontFamily,
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      );
  static TextStyle get normalTextStyle => TextStyle(
        fontSize: 14.sp,
        fontFamily: AssetHelper.fontFamily,
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      );
  static TextStyle get largeTextStyle => TextStyle(
        fontSize: 16.sp,
        fontFamily: AssetHelper.fontFamily,
        color: AppColors.textColor,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      );
  static TextStyle get extraLargeTextStyle => TextStyle(
        fontSize: 16.sp,
        fontFamily: AssetHelper.fontFamily,
        color: AppColors.textColor,
        fontWeight: FontWeight.w900,
        overflow: TextOverflow.ellipsis,
      );
}
