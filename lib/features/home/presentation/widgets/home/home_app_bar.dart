import 'package:events_app/core/themes/app_colors.dart';
import 'package:events_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      centerTitle: true,

      // 🔹 Menu button to open drawer
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),

      // 🔹 Logo in the center
      title: Image.asset(
        'assets/images/logo_white.png',
        height: 32.h,
      ),

      // 🔹 Notification icon
      actions: [
        CircleAvatar(
          radius: 16.r,
          backgroundColor: Colors.white.withOpacity(0.15),
          child: const Icon(
            Icons.notifications_active,
            color: Colors.white,
            size: 18,
          ),
        ),
        horizontalSpace(8),
      ],
    );
  }
}
