import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';

class LoginMobileView extends StatelessWidget {
  const LoginMobileView({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello Again!',
            style: MyTextStyles.extraLargeTextStyle.copyWith(fontSize: 26.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            "Welcome back you've been missed!",
            style: MyTextStyles.normalTextStyle,
          ),
          SizedBox(height: 30.h),
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            inputType: TextInputType.emailAddress,
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
              }
            },
            builder: (context, state) {
              return CustomButton(
                title: 'Login',
                onTap: () {
                  if (!emailController.text.contains('@')) {
                    showSnackBar(context, 'Invalid Email', isError: true);
                  } else if (passwordController.text.length < 6) {
                    showSnackBar(
                      context,
                      'Password should be atleast 6 characters',
                      isError: true,
                    );
                  } else {
                    context.read<AuthBloc>().add(
                          LogInEvent(
                            email: emailController.text,
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
    );
  }
}
