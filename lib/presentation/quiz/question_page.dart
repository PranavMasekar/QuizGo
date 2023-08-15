import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/models/export_models.dart';
import 'package:quiz_go/presentation/export_presentation.dart';

class QuestionPage extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChanged;

  const QuestionPage({
    super.key,
    required this.question,
    required this.onChanged,
  });

  @override
  State<QuestionPage> createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  late final CountDownController controller;

  @override
  void initState() {
    controller = CountDownController();
    super.initState();
  }

  @override
  void dispose() {
    controller.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        CircularCountDownTimer(
          duration: 31,
          width: 100.w,
          height: 100.h,
          isReverse: true,
          autoStart: true,
          isTimerTextShown: true,
          isReverseAnimation: true,
          strokeCap: StrokeCap.round,
          fillColor: AppColors.greenColor,
          ringColor: AppColors.primaryColor,
          textStyle: MyTextStyles.largeTextStyle.copyWith(fontSize: 24.sp),
          onComplete: () {
            debugPrint('Countdown Ended');
          },
        ),
        SizedBox(height: 50.h),
        Container(
          width: 300.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            color: AppColors.greyColor.withOpacity(0.25),
            border: Border.all(color: AppColors.greyColor),
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
          ),
          child: AutoSizeText(
            widget.question.question,
            style: MyTextStyles.normalTextStyle.copyWith(
              fontSize: 16.sp,
              height: 1.3,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 8,
          ),
        ),
        const Spacer(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.question.options.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                widget.onChanged();
              },
              child: OptionWidget(
                option: widget.question.options[index],
              ),
            );
          },
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}