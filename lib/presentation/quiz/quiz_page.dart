import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';
import 'package:quiz_go/presentation/export_presentation.dart';

class QuizPage extends StatefulWidget {
  final String category;
  const QuizPage({super.key, required this.category});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late final PageController _pageController;

  @override
  void initState() {
    context.read<QuizBloc>().add(LoadQuizEvent(category: widget.category));
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {
          if (state.status == QuizStatus.loaded) {
            context.read<ScoreCubit>().setQuiz(state.quiz.length);
          }
        },
        builder: (context, state) {
          return BackGround(
            child: SizedBox(
              height: context.getHeight(),
              width: context.getWidth(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: state.status == QuizStatus.loading
                    ? const LoadingWidget()
                    : Padding(
                        padding: EdgeInsets.only(top: 80.h),
                        child: PageView.builder(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.quiz.length,
                          itemBuilder: (context, index) {
                            return QuestionPage(
                              question: state.quiz[index],
                              onChanged: () {
                                if (index == state.quiz.length - 1) {
                                  //! Leaderboard Route
                                } else {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
