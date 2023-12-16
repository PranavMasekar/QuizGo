import 'package:flutter/material.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/context_extension.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.controller,
    super.key,
    this.hintText = '',
    this.inputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isObsecure = false,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType inputType;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    final style = MyTextStyles.normalTextStyle.copyWith(fontSize: 16);
    const radius = BorderRadius.all(Radius.circular(15));
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
          padding: EdgeInsets.symmetric(horizontal: context.getWidth() * 0.01),
          child: prefixIcon,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: suffixIcon,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor, width: 1),
          borderRadius: radius,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor, width: 1),
          borderRadius: radius,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor, width: 1),
          borderRadius: radius,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 1),
          borderRadius: radius,
        ),
      ),
    );
  }
}
