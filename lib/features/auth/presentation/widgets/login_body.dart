import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:events_app/core/utils/spacing.dart';
import 'package:events_app/core/widgets/app_button.dart';
import 'package:events_app/core/widgets/app_text_form_field.dart';
import 'package:events_app/features/auth/presentation/widgets/login_animated_logo.dart';
import 'package:events_app/features/auth/presentation/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// Animated logo
            LoginAnimatedLogo(),

            /// Login form positioned just below logo
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 80.h), // small gap below logo
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'login',
                      style: AppTextStyles.font18BlackBold,
                    ),
                    verticalSpace(10),
                    AppTextFormField(
                      hintText: 'Email',
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    AppTextFormField(
                      hintText: 'Password',
                      labelText: 'Password',
                      obscureText: obsecureText,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obsecureText = !obsecureText;
                            });
                          },
                          child: obsecureText
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility_outlined)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),
                    AppButton(
                      buttonText: ('Login'),
                      onPressed: () {},
                    ),
                    verticalSpace(20),
                    OrDivider(),
                    verticalSpace(20),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            buttonText: 'login as guest',
                            onPressed: () {},
                            height: 40.h,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                        horizontalSpace(10),
                        Expanded(
                          child: AppButton(
                            buttonText: 'Sign up',
                            onPressed: () {
                              context.push('/signUp');
                            },
                            backgroundColor: AppColors.secondaryColor,
                            height: 40.h,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ).animate().fade(
                  delay: Duration(seconds: 1),
                  duration: Duration(seconds: 1),
                ),
          ],
        ),
      ),
    );
  }
}
