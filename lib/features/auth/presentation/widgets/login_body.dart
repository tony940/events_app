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
  final PageController _pageController = PageController();
  int currentPage = 0; // 0 = email, 1 = phone

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void switchToPage(int index) {
    setState(() {
      currentPage = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Animated logo
              const LoginAnimatedLogo(),

              /// Login form
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 200.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // === Switch Buttons ===
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => switchToPage(0),
                            child: Text(
                              'Email',
                              style: AppTextStyles.font114BlackMedium.copyWith(
                                  decoration: currentPage == 0
                                      ? TextDecoration.underline
                                      : TextDecoration.none,
                                  color: currentPage == 0
                                      ? AppColors.primaryColor
                                      : Colors.black,
                                  fontWeight: currentPage == 0
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => switchToPage(1),
                            child: Text(
                              'Phone',
                              style: AppTextStyles.font114BlackMedium.copyWith(
                                decoration: currentPage == 1
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                color: currentPage == 1
                                    ? AppColors.primaryColor
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),

                      // === PageView (Email / Phone) ===
                      SizedBox(
                        height: 0.5.sh,
                        child: PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            /// ========== LOGIN WITH EMAIL ==========
                            Column(
                              children: [
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
                                    child: Icon(
                                      obsecureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                                verticalSpace(20),
                                AppButton(
                                  buttonText: 'Login',
                                  onPressed: () {},
                                ),
                                verticalSpace(20),
                                const OrDivider(),
                                verticalSpace(20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppButton(
                                        buttonText: 'Login as guest',
                                        onPressed: () {},
                                        height: 40.h,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                    ),
                                    horizontalSpace(10),
                                    Expanded(
                                      child: AppButton(
                                        buttonText: 'Sign up',
                                        onPressed: () {
                                          context.push('/signUp');
                                        },
                                        backgroundColor:
                                            AppColors.secondaryColor,
                                        height: 40.h,
                                        borderRadius:
                                            BorderRadius.circular(50.r),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            /// ========== LOGIN WITH PHONE ==========
                            Column(
                              children: [
                                AppTextFormField(
                                  hintText: 'Phone number',
                                  labelText: 'Phone number',
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
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
                                    child: Icon(
                                      obsecureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                                verticalSpace(20),
                                AppButton(
                                  buttonText: 'Login with Phone',
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fade(
                    delay: const Duration(seconds: 1),
                    duration: const Duration(seconds: 1),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
