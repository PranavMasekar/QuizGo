import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/context_extension.dart';

class LoginWebView extends StatelessWidget {
  const LoginWebView({
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: context.getWidth() * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello Again!',
                  style: MyTextStyles.largeTextStyle.copyWith(
                    fontSize: 11.sp,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Welcome back you've been missed!",
                  style: MyTextStyles.normalTextStyle.copyWith(
                    fontSize: 11.sp,
                  ),
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          SizedBox(
            width: context.getWidth() * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(height: 25),
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
                const SizedBox(height: 45),
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
                const SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    context.push('/signup');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: MyTextStyles.thinTextStyle
                              .copyWith(fontSize: 8.sp),
                        ),
                        TextSpan(
                          text: ' SignUp',
                          style: MyTextStyles.thinTextStyle.copyWith(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
