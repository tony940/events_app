import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerBrowseSection extends StatelessWidget {
  const DrawerBrowseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse',
            style: AppTextStyles.font14BlackRegular,
          ),
          ListTile(
            leading: SvgPicture.asset('assets/svgs/home.svg',
                width: 20.w, height: 20.h),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset('assets/svgs/search.svg',
                width: 20.w, height: 20.h),
            title: Text('Search'),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset('assets/svgs/event.svg',
                width: 20.w, height: 20.h),
            title: Text('Events'),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset('assets/svgs/profile.svg',
                width: 20.w, height: 20.h),
            title: Text('Profile'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
