import 'package:flutter/material.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/context_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onTap,
    super.key,
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
        height: context.getHeight() * 0.07,
        width: context.getWidth() * 0.25,
        decoration: BoxDecoration(
          gradient: AppColors.buttonGradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading
              ? showLoadingIndicator()
              : FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    title,
                    style: MyTextStyles.largeTextStyle,
                  ),
                ),
        ),
      ),
    );
  }
}
