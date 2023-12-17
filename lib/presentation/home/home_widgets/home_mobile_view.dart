import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getWidth() * 0.05),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            Text(
              'Programming Zone',
              style: MyTextStyles.extraLargeTextStyle.copyWith(fontSize: 24.sp),
            ),
            SizedBox(height: 30.h),
            StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: context.getWidth() * 0.05,
              mainAxisSpacing: context.getWidth() * 0.05,
              children: List.generate(
                techQuizCategories.length,
                (index) {
                  final quiz = techQuizCategories[index];
                  final height = quiz["height"] as int;
                  return SlideInUp(
                    child: QuizCard(
                      height: height.h,
                      width: context.getWidth() * 0.25,
                      color: quiz["color"],
                      svgPath: quiz["icon"],
                      ontap: () {
                        context.push(
                          '/quiz',
                          extra: {
                            'category': quiz["category"],
                            'id': -1,
                          },
                        );
                      },
                      name: quiz["category"],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              'Diverse Zone',
              style: MyTextStyles.extraLargeTextStyle.copyWith(fontSize: 24.sp),
            ),
            SizedBox(height: 30.h),
            StaggeredGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: context.getWidth() * 0.05,
              mainAxisSpacing: context.getWidth() * 0.05,
              children: List.generate(
                entertainmentQuizCategories.length,
                (index) {
                  final quiz = entertainmentQuizCategories[index];
                  return SlideInUp(
                    child: QuizCard(
                      height: quiz["height"],
                      width: context.getWidth() * 0.25,
                      color: quiz["color"],
                      svgPath: quiz["icon"],
                      ontap: () {
                        context.push(
                          '/quiz',
                          extra: {
                            'category': quiz["category"],
                            'id': quiz['id'],
                          },
                        );
                      },
                      name: quiz["category"],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
