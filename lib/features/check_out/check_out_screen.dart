import 'package:convention/core/generic_widgets/general_text_form_field.dart';
import 'package:convention/core/generic_widgets/main_button.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/features/base/base_screen.dart';
import 'package:convention/features/home/cubit/cart_cubit.dart';
import 'package:convention/features/check_out/cubit/check_out_cubit.dart';
import 'package:convention/features/check_out/cubit/check_out_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/check_out_page_widgets.dart';
import '../../core/theme/app_text_style.dart';
import '../../core/theme/gradient_class.dart';

class CheckOutScreen extends StatelessWidget {
  final double cartTotal;

  const CheckOutScreen({super.key, required this.cartTotal});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutCubit(cartTotal),
      child: BlocBuilder<CheckOutCubit, CheckOutState>(
        builder: (context, state) {
          return GradientBackground(
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(24.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SvgPicture.asset(AppImages.chevronLeft),
                            ),
                            Text(
                              AppStrings.checkOut.tr(),
                              style: AppTextStyle.f32w700White,
                            ),
                            SizedBox(height: 24.h, width: 24.w),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        SizedBox(
                          height: 240.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GeneralTextFormField(
                                hintText: AppStrings.addAddress.tr(),
                                borderRadius: 12.r,
                              ),
                              GeneralTextFormField(
                                hintText:
                                    AppStrings.addDeliveryInstruction.tr(),
                                borderRadius: 12.r,
                              ),
                              GeneralTextFormField(
                                hintText: AppStrings.addVoucherCode.tr(),
                                borderRadius: 12.r,
                                onChanged: (code) => context
                                    .read<CheckOutCubit>()
                                    .applyDiscount(code),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          AppStrings.selectPayment.tr(),
                          style: AppTextStyle.f24W600SubTitleColor,
                        ),
                        SizedBox(height: 24.h),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PaymentMethodBox(image: AppImages.visa),
                            PaymentMethodBox(image: AppImages.coinsHand),
                            PaymentMethodBox(image: AppImages.paypal),
                          ],
                        ),
                        SizedBox(height: 68.h),
                        SizedBox(
                          height: 241.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CheckOutSummary(
                                text: AppStrings.cartTotal.tr(),
                                price: state.cartTotal.toStringAsFixed(2),
                              ),
                              CheckOutSummary(
                                text: AppStrings.discount.tr(),
                                price: '-${state.discount.toStringAsFixed(2)}',
                              ),
                              CheckOutSummary(
                                text: AppStrings.delivery.tr(),
                                price: '10.00',
                              ),
                              CheckOutSummary(
                                text: AppStrings.tax.tr(),
                                price: '5.00',
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 35.r),
                                child: const Divider(),
                              ),
                              CheckOutSummary(
                                text: AppStrings.totalPaymentAmount.tr(),
                                price: state.totalPayment.toStringAsFixed(2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 34.h),
                        MainButton(
                          text: AppStrings.sendOrder.tr(),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  AppStrings.orderOnWay.tr(),
                                  style: AppTextStyle.f16w500PrimaryColor,
                                ),
                                duration: Duration(seconds: 3),
                                backgroundColor: AppColors.yellowColor,
                              ),
                            );
                            context
                                .read<CartCubit>()
                                .scheduleOrderNotification();
                            context.read<CartCubit>().clearCart();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BaseScreen()));
                          },
                        ),
                        SizedBox(height: 75.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PaymentMethodBox extends StatelessWidget {
  const PaymentMethodBox({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      width: 81.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: Colors.white,
        border: Border.all(color: AppColors.purpleColor),
      ),
      child: Center(
        child: SizedBox(
          height: 50.h,
          width: 50.w,
          child: SvgPicture.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
