import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class SpecificsContainer extends StatelessWidget {
  const SpecificsContainer({
    super.key,
    required this.num,
    required this.text,
  });
  final String num;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.purpleColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            num,
            style: AppTextStyle.f20w400SubTitle,
          ),
          Text(
            text,
            style: AppTextStyle.f20w400SubTitle,
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(
          width: 4.w,
        ),
        Text(
          text,
          style: AppTextStyle.f20w400SubTitle,
        ),
      ],
    );
  }
}
