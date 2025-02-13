import 'package:convention/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPageWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Lottie.asset(
          imagePath,
          height: 300.0,
        ),
        const SizedBox(height: 10.0),
        Text(
          title,
          style: AppTextStyle.f32w700White,
        ),
        const SizedBox(height: 8.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyle.f20w300White,
        ),
      ],
    );
  }
}
