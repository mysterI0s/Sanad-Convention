import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/category_widget_cubit.dart';
import 'cubit/category_widget_state.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final int index;

  const CategoryWidget({
    super.key,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final isSelected = state.selectedIndex == index;

        return GestureDetector(
          onTap: () => context.read<CategoryCubit>().selectCategory(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.yellowColor
                  : AppColors.customContainerColor,
              borderRadius: BorderRadius.circular(40),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: AppTextStyle.f16W700PrimaryColor.copyWith(
                    fontSize: 20,
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.subTitleColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
