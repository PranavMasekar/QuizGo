import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/models/export_models.dart';
import 'package:quiz_go/presentation/export_presentation.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    required this.question,
    required this.onChanged,
    super.key,
  });
  final QuestionModel question;
  final VoidCallback onChanged;

  @override
  State<QuestionPage> createState() => QuestionPageState();
}

class QuestionPageState extends State<QuestionPage> {
  final unescape = HtmlUnescape();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionBloc(),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CircularCountDownTimer(
            duration: 31,
            width: 100.w,
            height: 100.h,
            isReverse: true,
            isReverseAnimation: true,
            strokeCap: StrokeCap.round,
            fillColor: AppColors.greenColor,
            ringColor: AppColors.primaryColor,
            textStyle: MyTextStyles.largeTextStyle.copyWith(fontSize: 24.sp),
            onComplete: () {
              debugPrint('Countdown Ended');
              widget.onChanged();
            },
          ),
          SizedBox(height: 50.h),
          FadeIn(
            child: Container(
              width: 300.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.25),
                border: Border.all(color: AppColors.greyColor),
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
              ),
              child: AutoSizeText(
                unescape.convert(widget.question.question),
                style: MyTextStyles.normalTextStyle.copyWith(
                  fontSize: 16.sp,
                  height: 1.3,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
              ),
            ),
          ),
          const Spacer(),
          BlocConsumer<QuestionBloc, QuestionState>(
            listener: (context, state) {},
            builder: (context, state) {
              return FadeIn(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.question.options.length,
                  itemBuilder: (context, index) {
                    final option = widget.question.options[index];
                    return InkWell(
                      onTap: () {
                        if (!state.isOptionSelected) {
                          context
                              .read<QuestionBloc>()
                              .add(SelectedOptionEvent(optionId: option.id));
                          if (option.id == widget.question.correctOption) {
                            context.read<ScoreCubit>().addCorrectAnswer();
                          }
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              widget.onChanged();
                            },
                          );
                        }
                      },
                      child: OptionWidget(
                        option: option,
                        isOptionSelected: state.isOptionSelected,
                        correctOptionId: widget.question.correctOption,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
