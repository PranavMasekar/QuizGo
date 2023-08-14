import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/helpers/export_helpers.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double height, width;
  final bool isLoading;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.title,
    this.height = 50,
    this.width = 230,
    this.isLoading = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 230.w,
        decoration: BoxDecoration(
          gradient: AppColors.buttonGradient,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: isLoading
              ? Lottie.asset(
                  AssetHelper.circularAnimation,
                  repeat: true,
                  fit: BoxFit.fill,
                  frameRate: FrameRate(60),
                )
              : Text(
                  title,
                  style: MyTextStyles.largeTextStyle,
                ),
        ),
      ),
    );
  }
}
