import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import 'cubit/text_form_field_cubit.dart';
import 'cubit/text_form_field_state.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.isPassword = false,
    this.isConfirmPassword = false,
    required this.controller,
    this.hintText,
    this.keyboardType,
  });

  final bool isPassword;
  final bool isConfirmPassword;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
      builder: (context, state) {
        final cubit = context.read<TextFormFieldCubit>();

        return SizedBox(
          height: 48.h,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              labelText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintStyle: TextStyle(
                fontSize: 16.sp,
                color: AppColors.primaryColor,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 16.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              suffixIcon: (isPassword || isConfirmPassword)
                  ? IconButton(
                      onPressed: () {
                        if (isPassword) {
                          cubit.changeHiddenStatue();
                        } else if (isConfirmPassword) {
                          cubit.changeConfrimHiddenStatue();
                        }
                      },
                      icon: Icon(
                        (isPassword && cubit.hiddenPassword) ||
                                (isConfirmPassword &&
                                    cubit.hiddenConfirmPassword)
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    )
                  : null,
            ),
            obscureText: isPassword
                ? cubit.hiddenPassword
                : isConfirmPassword
                    ? cubit.hiddenConfirmPassword
                    : false,
          ),
        );
      },
    );
  }
}
