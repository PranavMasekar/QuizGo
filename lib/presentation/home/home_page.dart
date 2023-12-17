import 'package:flutter/material.dart';
import 'package:quiz_go/common/widgets/export_widgets.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';
import 'package:quiz_go/presentation/export_presentation.dart';

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1000) {
                return const HomeWebView();
              } else {
                return const HomeMobileView();
              }
            },
          ),
        ),
      ),
    );
  }
}
