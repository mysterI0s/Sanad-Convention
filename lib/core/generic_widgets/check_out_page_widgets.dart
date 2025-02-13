import 'package:convention/core/generic_widgets/general_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onSelect,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: 64.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isSelected ? AppColors.yellowColor : Colors.white,
            width: 2,
          ),
          color: isSelected
              ? AppColors.yellowColor.withOpacity(0.3)
              : Colors.transparent,
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            style: AppTextStyle.f16W400SubTitleColor.copyWith(
              color: isSelected ? Colors.black : Colors.white,
            ),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

class CheckOutSummary extends StatelessWidget {
  const CheckOutSummary({
    super.key,
    required this.text,
    required this.price,
  });

  final String text;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppTextStyle.f16w600White),
        Text('\$ $price', style: AppTextStyle.f16w600White),
      ],
    );
  }
}

class CustomField extends StatelessWidget {
  final String title;
  final String content;
  final ValueChanged<String>? onChanged;

  const CustomField({
    super.key,
    required this.title,
    required this.content,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: GeneralTextFormField(
            hintText: content,
            borderRadius: 12.r,
            onChanged: onChanged,
          ),
        ),
        Positioned(
          left: 16,
          top: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.subTitleColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: AppTextStyle.f16w500PrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentCustom extends StatelessWidget {
  final String title;
  final String selectedMethod;
  final Function(String) onSelect;

  const PaymentCustom({
    super.key,
    required this.title,
    required this.selectedMethod,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final paymentMethods = [
      AppStrings.cash.tr(),
      AppStrings.creditCard.tr(),
      AppStrings.paypal.tr(),
    ];

    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Container(
            height: 116.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.purpleColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: paymentMethods.map((method) {
                return PaymentMethods(
                  text: method,
                  isSelected: selectedMethod == method,
                  onSelect: () => onSelect(method),
                );
              }).toList(),
            ),
          ),
        ),
        Positioned(
          left: 16,
          top: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.subTitleColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: AppTextStyle.f16w500PrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
