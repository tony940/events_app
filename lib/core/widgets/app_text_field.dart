import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.borderColor = AppColors.primaryColor,
    this.fillColor = AppColors.white,
    this.borderRadius,
    this.borderWidth = 1.0,
  });

  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Color borderColor;
  final Color fillColor;
  final BorderRadius? borderRadius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //make it unfoucs outside
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      style: AppTextStyles.font12LightBlackWeight500,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.font12LightBlackWeight500,
        filled: true,
        fillColor: fillColor,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: borderWidth + 0.5,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
