import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/models/export_models.dart';

class OptionWidget extends StatelessWidget {
  final Option option;
  const OptionWidget({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.25),
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: AutoSizeText(
        option.text,
        style: MyTextStyles.normalTextStyle.copyWith(
          fontSize: 16.sp,
          height: 1.3,
        ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 3,
      ),
    );
  }
}
