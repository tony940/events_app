import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:events_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to search page
      },
      child: Container(
        padding: EdgeInsets.all(16),
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.geryLight,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/svgs/search.svg'),
            horizontalSpace(10),
            Text(
              'Search for events, categories...',
              style: AppTextStyles.font10LightBlackWeight500,
            ),
          ],
        ),
      ),
    );
  }
}
