import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:events_app/core/utils/spacing.dart';
import 'package:events_app/core/widgets/app_button.dart';
import 'package:events_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  bool obsecureText = true;
  final PageController _pageController = PageController();
  int currentPage = 0; // 0 = email, 1 = phone

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void switchToPage(int index) {
    setState(() => currentPage = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button + Title
              Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  horizontalSpace(10),
                  Text(
                    'Sign up',
                    style: AppTextStyles.font20BlackBold,
                  ),
                ],
              ),
              verticalSpace(20),

              // Switch between email / phone signup
              Row(
                children: [
                  GestureDetector(
                    onTap: () => switchToPage(0),
                    child: Text(
                      'Sign up with email',
                      style: AppTextStyles.font114BlackMedium.copyWith(
                        decoration: currentPage == 0
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        color: currentPage == 0
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => switchToPage(1),
                    child: Text(
                      'Sign up with phone',
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
              verticalSpace(30),

              // PageView for Email / Phone signup
              SizedBox(
                height: 0.7.sh,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // =============== SIGN UP WITH EMAIL ===============
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextFormField(
                          hintText: 'Full Name',
                          labelText: 'Full Name',
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
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
                        verticalSpace(10),
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
                          buttonText: 'Sign up with Email',
                          onPressed: () {},
                        ),
                      ],
                    ),

                    // =============== SIGN UP WITH PHONE ===============
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextFormField(
                          hintText: 'Full Name',
                          labelText: 'Full Name',
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
                        AppTextFormField(
                          hintText: 'Phone Number',
                          labelText: 'Phone Number',
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        verticalSpace(10),
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
                          buttonText: 'Sign up with Phone',
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
      ),
    );
  }
}
