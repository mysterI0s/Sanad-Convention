import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String description;

  const NotificationWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.purpleColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            SvgPicture.asset(AppImages.yellowLogo),
            SizedBox(
              width: 16.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.r),
                  child: Text(
                    title,
                    style: AppTextStyle.f16W400SubTitleColor
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  description,
                  style: AppTextStyle.f16W300RedColor
                      .copyWith(fontSize: 12.sp, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
