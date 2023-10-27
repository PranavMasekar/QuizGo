import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_go/blocs/export_bloc.dart';
import 'package:quiz_go/common/export_common.dart';
import 'package:quiz_go/constants/export_constants.dart';
import 'package:quiz_go/extensions/export_extension.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<ResetPassword> {
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: MyTextStyles.extraLargeTextStyle
                      .copyWith(fontSize: 26.sp),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Reset Password to get started!',
                  style: MyTextStyles.normalTextStyle,
                ),
                SizedBox(height: 30.h),
                MyTextField(
                  controller: userNameController,
                  hintText: 'Username',
                  inputType: TextInputType.name,
                  prefixIcon: const Icon(
                    Icons.person_outline_rounded,
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
                    if (state.status == AuthStatus.signup) {
                      context.go('/home');
                      showSnackBar(context, state.digest);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      title: 'Reset Password',
                      onTap: () {
                        if (userNameController.text == '') {
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
                                ResetPasswordEvent(
                                  username: userNameController.text,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
