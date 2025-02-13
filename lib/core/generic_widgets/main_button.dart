import 'package:convention/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.minWidth = double.infinity,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColors.yellowColor,
    this.textStyle = AppTextStyle.f20W600PrimaryColor,
  });

  final double minWidth;
  final String text;
  final Function onPressed;
  final Color buttonColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: buttonColor,
      minWidth: minWidth,
      height: 52.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: textStyle.copyWith(fontSize: textStyle.fontSize?.sp),
      ),
    );
  }
}
