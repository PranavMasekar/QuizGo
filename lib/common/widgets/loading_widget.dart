import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_go/helpers/export_helpers.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AssetHelper.loadingAnimation,
      repeat: true,
      frameRate: FrameRate(60),
    );
  }
}
