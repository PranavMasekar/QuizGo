import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/common/widgets/export_widgets.dart';
import 'package:quiz_go/extensions/export_extension.dart';
import 'package:quiz_go/helpers/export_helpers.dart';

import '../../constants/export_constants.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

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
            child: BlocBuilder<ScoreCubit, ScoreState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AssetHelper.trophyAnimation),
                    SizedBox(height: 15.h),
                    Text(
                      "Correct answeres ${state.correctQuestion} out of ${state.totalQuestions}",
                      style: MyTextStyles.largeTextStyle,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "You scored ${state.correctQuestion * 10} points",
                      style: MyTextStyles.largeTextStyle,
                    ),
                    SizedBox(height: 50.h),
                    CustomButton(
                      title: "Home",
                      onTap: () {
                        context.go('/home');
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
