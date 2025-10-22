import 'package:cached_network_image/cached_network_image.dart';
import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:events_app/core/utils/spacing.dart';
import 'package:events_app/features/home/presentation/widgets/drawer/drawer_browse_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerSupportSection extends StatelessWidget {
  const DrawerSupportSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(left: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support & Help',
            style: AppTextStyles.font14BlackRegular,
          ),
          ListTile(
            leading: SvgPicture.asset('assets/svgs/telephone.svg',
                width: 20.w, height: 20.h),
            title: Text('Contact us'),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset('assets/svgs/about.svg',
                width: 20.w, height: 20.h),
            title: Text('About LeapTech'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
