import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:convention/features/home/cubit/cart_cubit.dart';
import 'package:convention/features/home/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InnovativeMealWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const InnovativeMealWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 184.w,
      height: 260.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 32.h,
            child: Container(
              height: 186.h,
              width: 176.w,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.customContainerColor,
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 72.h,
                  ),
                  Text(
                    title,
                    style: AppTextStyle.f16W400SubTitleColor.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    price,
                    style: AppTextStyle.f16W400SubTitleColor.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -2.h,
            left: 32.w,
            child: SizedBox(
              height: 120.h,
              width: 120.w,
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 32.h,
            left: 68.w,
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                radius: 48.r,
                onTap: () {
                  final newItem = CartItem(
                    imagePath: imagePath,
                    title: title,
                    price: double.parse(price.substring(1)),
                    quantity: 1,
                    description: '',
                    calories: '',
                  );
                  context.read<CartCubit>().addToCart(newItem);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.subTitleColor,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: CircleAvatar(
                    backgroundColor: AppColors.yellowColor,
                    radius: 24.r,
                    child: SvgPicture.asset(
                      AppImages.cart,
                    ),
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
