import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/models/export_models.dart';

class OptionWidget extends StatelessWidget {
  OptionWidget({
    required this.option,
    required this.isOptionSelected,
    required this.correctOptionId,
    super.key,
  });
  final Option option;
  final bool isOptionSelected;
  final String correctOptionId;
  final unescape = HtmlUnescape();

  Color getColor() {
    if (isOptionSelected && correctOptionId == option.id) {
      return AppColors.greenColor;
    } else if (isOptionSelected) {
      return AppColors.redColor;
    } else {
      return AppColors.greyColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    log(unescape.convert(option.text));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: getColor().withOpacity(0.25),
        border: Border.all(color: getColor()),
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: AutoSizeText(
        unescape.convert(option.text),
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
