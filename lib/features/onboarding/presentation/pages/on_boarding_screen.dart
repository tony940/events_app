import 'package:events_app/core/services/shared_pref_service.dart';
import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:events_app/core/widgets/app_button.dart';
import 'package:events_app/features/onboarding/presentation/widgets/on_boardin_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/abstractBackground.png',
            fit: BoxFit.cover,
          ),

          // Foreground content
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OnBoardingRichText().animate().fade(
                        duration: Duration(seconds: 2),
                      ),
                  SizedBox(height: 16.h),
                  Text(
                    'Find an easy way to buy your favourite ticket',
                    style: AppTextStyles.font16WhiteRegular,
                  ).animate().fade(
                        duration: Duration(seconds: 2),
                      ),
                  Image.asset('assets/images/ticket.png')
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .shake(
                        hz: 1,
                        duration: Duration(seconds: 1),
                      ),
                  Spacer(),
                  AppButton(
                      buttonText: 'Get started',
                      onPressed: () {
                        // raise flag of onBoarding done
                        SharedPreferencesService()
                            .saveData('onBoardingDone', true);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
