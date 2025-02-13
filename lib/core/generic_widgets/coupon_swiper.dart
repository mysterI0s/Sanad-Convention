import 'package:convention/core/constants/app_images.dart';
import 'package:convention/features/home/cubit/coupon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponSwiper extends StatelessWidget {
  CouponSwiper({super.key});

  final List<String> couponImages = [AppImages.coupon1, AppImages.coupon2];

  final PageController _pageController = PageController(initialPage: 1000);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CouponCubit(_pageController),
      child: BlocBuilder<CouponCubit, int>(
        builder: (context, pageIndex) {
          return SizedBox(
            height: 180.h,
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                final imageIndex = index % couponImages.length;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    couponImages[imageIndex],
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                );
              },
              onPageChanged: (index) {
                context.read<CouponCubit>().updatePage(index);
              },
            ),
          );
        },
      ),
    );
  }
}
