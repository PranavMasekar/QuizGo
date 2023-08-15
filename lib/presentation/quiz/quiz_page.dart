import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';

class QuizPage extends StatefulWidget {
  final String category;
  const QuizPage({super.key, required this.category});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    context.read<QuizBloc>().add(LoadQuizEvent(category: widget.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BackGround(
            child: SizedBox(
              height: context.getHeight(),
              width: context.getWidth(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: state.status == QuizStatus.loading
                    ? const LoadingWidget()
                    : Column(
                        children: [
                          SizedBox(height: 80.h),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
