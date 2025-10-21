import 'package:events_app/core/services/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        if (SharedPreferencesService().getData('onBoardingDone') == null) {
          context.pushReplacement('/onBoarding');
        } else {
          context.pushReplacement('/login');
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/abstractBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          Animate(
            effects: [
              FadeEffect(
                duration: Duration(seconds: 3),
              ),
            ],
            child: Center(
              child: Image.asset(
                'assets/images/logo_white.png',
                width: 200.w,
              ),
            ),
          )
        ],
      ),
    );
  }
}
