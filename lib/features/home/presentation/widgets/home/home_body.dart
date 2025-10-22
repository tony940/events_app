import 'package:cached_network_image/cached_network_image.dart';
import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:events_app/core/utils/spacing.dart';
import 'package:events_app/features/home/presentation/widgets/home/search_container.dart';
import 'package:events_app/features/home/presentation/widgets/home/upcoming_event_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Title
          Text(
            'Discover New Events',
            style: AppTextStyles.font20BlackBold.copyWith(
              color: AppColors.primaryColor,
              fontSize: 22.sp,
            ),
          ),
          verticalSpace(12),

          // 🔹 Search box
          const SearchContainer(),
          verticalSpace(32),

          //Container for to tell user discover events
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.geryLight,
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/abstractBackground.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Discover events happening around Kuwait!',
                    style: AppTextStyles.font16WhiteBold,
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://images.pexels.com/photos/976866/pexels-photo-976866.jpeg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(32),

          // 🔹 Featured Event Section

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Future Events',
                style: AppTextStyles.font114BlackMedium.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: AppTextStyles.font11BlackMedium,
                ),
              ),
            ],
          ),
          verticalSpace(12),
          //List view builder of future events
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return UpcomingEventContainer();
            },
          ),
        ],
      ),
    );
  }
}
