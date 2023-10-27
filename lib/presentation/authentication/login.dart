import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
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
                  'Hello Again!',
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
                  controller: usernameController,
                  hintText: 'Username',
                  inputType: TextInputType.name,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.textColor,
                  ),
                ),
                SizedBox(height: 15.h),
                BlocBuilder<PasswordCubit, PasswordState>(
                  builder: (context, passwordState) {
                    return MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      inputType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        color: AppColors.textColor,
                      ),
                      isObsecure: passwordState.showPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          context.read<PasswordCubit>().changeState();
                        },
                        child: Icon(
                          passwordState.showPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.textColor,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        context.push('/reset-password');
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          "Reset Password",
                          style: MyTextStyles.normalTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 45.h),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state.status == AuthStatus.error) {
                      log('Error : ${state.errorMessage}');
                      showSnackBar(
                        context,
                        state.errorMessage,
                        isError: true,
                      );
                    }
                    if (state.status == AuthStatus.login) {
                      context.go('/home');
                      showSnackBar(context, state.digest);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      title: 'Login',
                      onTap: () {
                        if (usernameController.text == '') {
                          showSnackBar(
                            context,
                            'Enter valid username',
                            isError: true,
                          );
                        } else if (passwordController.text.length < 6) {
                          showSnackBar(
                            context,
                            'Password should be atleast 6 characters',
                            isError: true,
                          );
                        } else {
                          context.read<AuthBloc>().add(
                                LogInEvent(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                ),
                              );
                        }
                      },
                      isLoading: state.status == AuthStatus.loading,
                    );
                  },
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    context.push('/signup');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: MyTextStyles.normalTextStyle,
                        ),
                        TextSpan(
                          text: ' SignUp',
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
