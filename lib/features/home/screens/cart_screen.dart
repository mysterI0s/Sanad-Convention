import 'package:convention/core/generic_widgets/main_button.dart';
import 'package:convention/features/check_out/check_out_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/gradient_class.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        bool isCartEmpty = state.cartItems.isEmpty;
        double totalPrice = state.cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
        return GradientBackground(
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        AppStrings.cart.tr(),
                        style: AppTextStyle.f32w700White,
                      ),
                    ),
                    SizedBox(height: 44.h),
                    if (isCartEmpty)
                      Expanded(
                        child: Center(
                          child: Text(
                            'Start your Space journey by adding the best space food and gifts!',
                            style: AppTextStyle.f24w500Yellow,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        height: 420.h,
                        child: ListView.separated(
                          itemCount: state.cartItems.length,
                          itemBuilder: (context, index) {
                            final cartItem = state.cartItems[index];
                            return Container(
                              width: double.infinity,
                              height: 124.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: AppColors.purpleColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: Image.asset(
                                      cartItem.imagePath,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12.h),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          cartItem.title.tr(),
                                          style: AppTextStyle.f20W600PrimaryColor.copyWith(color: Colors.white),
                                        ),
                                        Text(
                                          '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                                          style: AppTextStyle.f16W400SubTitleColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 16.r),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              context.read<CartCubit>().deleteFromCart(cartItem);
                                            },
                                            child: SvgPicture.asset(AppImages.cross),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context.read<CartCubit>().removeFromCart(cartItem);
                                                },
                                                child: Container(
                                                  height: 22.h,
                                                  width: 22.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white.withOpacity(0.2),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(child: SvgPicture.asset(AppImages.minus)),
                                                ),
                                              ),
                                              Text(
                                                '${cartItem.quantity}',
                                                style: TextStyle(color: Colors.white, fontSize: 24.sp),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context.read<CartCubit>().addToCart(cartItem);
                                                },
                                                child: Container(
                                                  height: 24.h,
                                                  width: 24.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white.withOpacity(0.01),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(child: SvgPicture.asset(AppImages.plus)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (_, __) => SizedBox(height: 16.h),
                        ),
                      ),

                    if (!isCartEmpty) SizedBox(height: 8.h),
                    if (!isCartEmpty)
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 58.h,
                            decoration: BoxDecoration(
                              color: AppColors.purpleColor,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.r),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.total.tr(),
                                    style: AppTextStyle.f20W200PrimaryColor.copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    '\$${totalPrice.toStringAsFixed(2)}',
                                    style: AppTextStyle.f20W200PrimaryColor.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 58.h),
                          MainButton(
                            text: AppStrings.continueText.tr(),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CheckOutScreen(cartTotal: totalPrice),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
