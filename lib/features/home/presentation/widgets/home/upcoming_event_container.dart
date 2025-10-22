import 'package:cached_network_image/cached_network_image.dart';
import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:events_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpcomingEventContainer extends StatelessWidget {
  const UpcomingEventContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Event Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg',
                    height: 100.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(12),

                // 🔹 Event Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Event Name Here',
                        style: AppTextStyles.font16WhiteBold.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      verticalSpace(6),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: AppColors.white, size: 16.sp),
                          horizontalSpace(4),
                          Text(
                            'Kuwait',
                            style: AppTextStyles.font14BlackRegular
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          '\$20',
                          style: AppTextStyles.font10LightBlackWeight500
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Decorative Image Overlay
          Positioned(
            right: -10.w,
            top: -80.h,
            child: Image.asset(
              'assets/images/upcoming_event.png',
              width: 130.w,
              height: 130.h,
            ),
          ),
        ],
      ),
    );
  }
}
