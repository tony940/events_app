import 'package:cached_network_image/cached_network_image.dart';
import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:events_app/core/utils/spacing.dart';
import 'package:events_app/features/home/presentation/widgets/drawer/drawer_browse_section.dart';
import 'package:events_app/features/home/presentation/widgets/drawer/drawer_settings_section.dart';
import 'package:events_app/features/home/presentation/widgets/drawer/drawer_support_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(
                          'https://images.stockcake.com/public/2/5/b/25b212d6-d108-450a-b6d1-d497cbe9d1e2_large/handsome-man-portrait-stockcake.jpg')),
                  Text(
                    'John Doe',
                    style: AppTextStyles.font16WhiteBold,
                  ),
                  Text(
                    '+2857903175813',
                    style: AppTextStyles.font114BlackMedium.copyWith(
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerBrowseSection(),
                verticalSpace(8),
                DrawerSupportSection(),
                verticalSpace(8),
                DrawerSettingsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
