import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const int itemCount = 4;
    double itemWidth = screenWidth / itemCount;

    return Container(
      height: 56.h,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: currentIndex * itemWidth,
            top: 0,
            child: Container(
              width: itemWidth,
              height: 56.h,
              decoration: BoxDecoration(
                color: AppColors.yellowColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              itemCount,
              (index) => GestureDetector(
                onTap: () => onTap(index),
                child: SizedBox(
                  width: itemWidth,
                  height: 72.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        [
                          AppImages.home,
                          AppImages.search,
                          AppImages.cart,
                          AppImages.user,
                        ][index],
                        width: 24.w,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          index == currentIndex ? Colors.black : Colors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        [
                          AppStrings.home.tr(),
                          'Search',
                          'Cart',
                          'Profile'
                        ][index],
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: index == currentIndex
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
