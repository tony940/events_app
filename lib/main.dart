import 'package:device_preview/device_preview.dart';
import 'package:events_app/core/routing/app_router.dart';
import 'package:events_app/core/services/shared_pref_service.dart';
import 'package:events_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  //ensure initialization
  WidgetsFlutterBinding.ensureInitialized();
  //initialize screenutil
  ScreenUtil.ensureScreenSize();
  //shared pref init
  SharedPreferencesService().init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => EventsApp(),
    ),
  );
}

class EventsApp extends StatelessWidget {
  const EventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
