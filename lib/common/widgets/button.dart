import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';

class CustomButton extends StatelessWidget {

  const CustomButton({
    required this.title, required this.onTap, super.key,
    this.height = 50,
    this.width = 230,
    this.isLoading = false,
  });
  final String title;
  final double height, width;
  final bool isLoading;
  final VoidCallback onTap;

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
              ? showLoadingIndicator()
              : Text(
                  title,
                  style: MyTextStyles.largeTextStyle,
                ),
        ),
      ),
    );
  }
}
