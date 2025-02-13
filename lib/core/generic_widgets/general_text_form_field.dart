import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class GeneralTextFormField extends StatelessWidget {
  const GeneralTextFormField({
    super.key,
    required this.hintText,
    this.borderRadius,
    this.onChanged,
  });

  final String hintText;
  final double? borderRadius;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: AppTextStyle.f20w400SubTitle.copyWith(color: Colors.white),
      decoration: InputDecoration(
        fillColor: AppColors.purpleColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyle.f20w400SubTitle
            .copyWith(color: Colors.white.withOpacity(0.5)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
