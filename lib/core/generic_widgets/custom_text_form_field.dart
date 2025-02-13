import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFormFieldSvg extends StatelessWidget {
  const TextFormFieldSvg({
    super.key,
    required this.image,
    required this.place,
  });
  final String image;
  final AlignmentGeometry place;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: place,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.r),
        child: SvgPicture.asset(
          image,
          height: 24.h,
          width: 24.w,
        ),
      ),
    );
  }
}
