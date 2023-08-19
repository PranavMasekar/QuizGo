import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quiz_go/constants/export_constants.dart';

class QuizCard extends StatelessWidget {

  const QuizCard({
    required this.height, required this.width, required this.color, required this.ontap, required this.name, super.key,
  });
  final int height, width;
  final Color color;
  final VoidCallback ontap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: color.withOpacity(0.25),
          border: Border.all(color: color),
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              name,
              style: MyTextStyles.largeTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
