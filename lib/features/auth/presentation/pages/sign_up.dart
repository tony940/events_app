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

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<SignUpBody> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  horizontalSpace(10),
                  Text(
                    'Sign up',
                    style: AppTextStyles.font20BlackBold,
                  ),
                ],
              ),
              verticalSpace(40),
              AppTextFormField(
                hintText: 'Name',
                labelText: 'Name',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              verticalSpace(10),
              AppTextFormField(
                hintText: 'phone number',
                labelText: 'phone number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
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
                buttonText: ('Sign up'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
