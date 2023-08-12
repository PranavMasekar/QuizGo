import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/constants/export_constants.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType inputType;
  final bool isObsecure;
  const MyTextField({
    super.key,
    required this.controller,
    this.hintText = "",
    this.inputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.normalTextStyle.copyWith(fontSize: 16.sp);
    final radius = BorderRadius.all(Radius.circular(15.r));
    return TextField(
      style: style,
      controller: controller,
      keyboardType: inputType,
      obscureText: isObsecure,
      cursorColor: AppColors.textColor,
      decoration: InputDecoration(
        labelStyle: style,
        fillColor: AppColors.greyColor.withOpacity(0.15),
        filled: true,
        hintText: hintText,
        hintStyle: style,
        errorStyle: style,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: prefixIcon,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 15.w),
          child: suffixIcon,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor, width: 1.w),
          borderRadius: radius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor, width: 1.w),
          borderRadius: radius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor, width: 1.w),
          borderRadius: radius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 1.w),
          borderRadius: radius,
        ),
      ),
    );
  }
}
