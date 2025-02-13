import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';

class ProfileBoxes extends StatelessWidget {
  const ProfileBoxes({
    super.key,
    this.onPressed1,
    this.onPressed2,
    this.onPressed3,
    this.onPressed4,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
    this.svg1,
    this.svg2,
    this.svg3,
    this.svg4,
    this.visible2,
    this.visible3,
    this.visible4,
  });
  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;
  final VoidCallback? onPressed3;
  final VoidCallback? onPressed4;
  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? svg1;
  final String? svg2;
  final String? svg3;
  final String? svg4;

  final bool? visible2;
  final bool? visible3;
  final bool? visible4;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.purpleColor,
      ),
      width: 408.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButtonProfile(onPressed: onPressed1, svg: svg1, text: text1),
          Visibility(
              visible: visible2 ?? true,
              child: TextButtonProfile(
                  onPressed: onPressed2, svg: svg2, text: text2)),
          Visibility(
              visible: visible3 ?? true,
              child: TextButtonProfile(
                  onPressed: onPressed3, svg: svg3, text: text3)),
          Visibility(
              visible: visible4 ?? true,
              child: TextButtonProfile(
                  onPressed: onPressed4, svg: svg4, text: text4)),
        ],
      ),
    );
  }
}

class TextButtonProfile extends StatelessWidget {
  const TextButtonProfile({
    super.key,
    this.onPressed,
    this.svg,
    this.text,
  });

  final VoidCallback? onPressed;
  final String? svg;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        width: 306.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(svg ?? ''),
                SizedBox(width: 12.w),
                Text(
                  text ?? '',
                  style: AppTextStyle.f16W400SubTitleColor,
                ),
              ],
            ),
            Visibility(child: SvgPicture.asset(AppImages.chevronRight))
          ],
        ),
      ),
    );
  }
}
