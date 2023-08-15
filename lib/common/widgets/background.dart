import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.getHeight(),
      width: context.getWidth(),
      color: AppColors.darkPurple,
      child: Stack(
        children: [
          Positioned(
            left: -100,
            top: 200,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: AppColors.purpleGradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -100,
            bottom: 200,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: AppColors.pinkGradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: -100,
            top: -30,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                gradient: AppColors.creamGradient,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -90,
            bottom: -50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  gradient: AppColors.redGradient, shape: BoxShape.circle),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
              child: SizedBox(
                height: context.getHeight(),
                width: context.getWidth(),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
