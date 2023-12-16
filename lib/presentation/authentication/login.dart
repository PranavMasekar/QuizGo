import 'package:flutter/material.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';
import 'package:quiz_go/presentation/export_presentation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                return LoginWebView(
                  emailController: emailController,
                  passwordController: passwordController,
                );
              } else {
                return LoginMobileView(
                  emailController: emailController,
                  passwordController: passwordController,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
