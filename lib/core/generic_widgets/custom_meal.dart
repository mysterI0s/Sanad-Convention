import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';

class CustomMeal extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const CustomMeal({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 162.h,
        width: 130.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: AppColors.purpleColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.f14W600OrColor.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              description,
              style: AppTextStyle.f14W600OrColor.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
