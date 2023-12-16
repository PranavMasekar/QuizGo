import 'package:flutter/material.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';
import 'package:quiz_go/presentation/export_presentation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

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
                return SignUpWebView(
                  emailController: emailController,
                  passwordController: passwordController,
                  userNameController: userNameController,
                );
              } else {
                return SignUpMobileView(
                  emailController: emailController,
                  passwordController: passwordController,
                  userNameController: userNameController,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
