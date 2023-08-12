import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hello Again!",
                  style: MyTextStyles.extraLargeTextStyle
                      .copyWith(fontSize: 26.sp),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Welcome back you've been missed!",
                  style: MyTextStyles.normalTextStyle,
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  inputType: TextInputType.emailAddress,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(height: 15.h),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  inputType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.textColor,
                  ),
                  isObsecure: true,
                  suffixIcon: const Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(height: 45.h),
                CustomButton(
                  title: "Login",
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    context.push("/signup");
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: MyTextStyles.normalTextStyle,
                        ),
                        TextSpan(
                          text: " SignUp",
                          style: MyTextStyles.largeTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
