import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealsCard extends StatelessWidget {
  final String image;
  final String title;
  // final String subtitle;
  final String description;
  final String calories;
  final String price;

  const MealsCard({
    super.key,
    required this.image,
    required this.title,
    // required this.subtitle,
    required this.description,
    required this.calories,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.purpleColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            height: 120.h,
            width: 120.w,
            fit: BoxFit.fitHeight,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: AppTextStyle.f20W600PrimaryColor
                      .copyWith(color: Colors.white),
                ),
                Text(
                  description,
                  style: AppTextStyle.f16w200SubTitleColor
                      .copyWith(fontSize: 12.sp),
                ),
                SizedBox(
                  width: 160.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        calories,
                        style: AppTextStyle.f16W400SubTitleColor,
                      ),
                      Text(
                        price,
                        style: AppTextStyle.f16w200SubTitleColor.copyWith(
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
