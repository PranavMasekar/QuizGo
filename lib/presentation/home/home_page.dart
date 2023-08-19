import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import 'package:quiz_go/common/widgets/export_widgets.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BackGround(
        child: SizedBox(
          height: context.getHeight(),
          width: context.getWidth(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80.h),
                Text(
                  'Programming',
                  style: MyTextStyles.extraLargeTextStyle
                      .copyWith(fontSize: 24.sp),
                ),
                SizedBox(height: 30.h),
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  children: List.generate(
                    techQuizCategories.length,
                    (index) {
                      final quiz = techQuizCategories[index];
                      return QuizCard(
                        height: quiz["height"],
                        width: 200,
                        color: quiz["color"],
                        svgPath: quiz["icon"],
                        ontap: () {
                          context.push('/quiz', extra: quiz["category"]);
                        },
                        name: quiz["category"],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
