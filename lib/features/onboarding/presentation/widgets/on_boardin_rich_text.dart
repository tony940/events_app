import 'package:events_app/core/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingRichText extends StatelessWidget {
  const OnBoardingRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: 'Discover your ', style: AppTextStyles.font36WhiteBold),
            TextSpan(
              text: 'Future ',
              style: AppTextStyles.font36WhiteBold.copyWith(
                color: Colors.yellow,
              ),
            ),
            TextSpan(
              text: 'Events Easly',
              style: AppTextStyles.font36WhiteBold.copyWith(),
            ),
          ],
        ),
        softWrap: true,
      ),
    );
  }
}
