import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/constants/data_bank.dart';
import 'package:convention/core/generic_widgets/back_arrow_widget.dart';
import 'package:convention/core/generic_widgets/food_chip.dart';
import 'package:convention/core/generic_widgets/main_button.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:convention/core/theme/gradient_class.dart';
import 'package:convention/features/custom_meal/cubit/custom_meal_cubit.dart';
import 'package:convention/features/custom_meal/cubit/custom_meal_state.dart';
import 'package:convention/features/meals_details/meals_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YourMeals2 extends StatelessWidget {
  const YourMeals2({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
        child: Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16.r, left: 16.r, right: 16.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ArrowBackWidget(),
                    Text(
                      AppStrings.yourMeals.tr(),
                      style: AppTextStyle.f32w700White,
                    ),
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                    )
                  ],
                ),
                ...DataBank.foodChipsCategories.entries.map(
                  (category) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(category.key, style: AppTextStyle.f32w700White),
                        SizedBox(height: 16.h),
                        Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: category.value.map(
                            (foodItem) {
                              return BlocBuilder<CustomMealCubit,
                                  CustomMealState>(
                                builder: (context, state) {
                                  bool isSelected = state
                                          .selectedFoodItems[category.key]
                                          ?.contains(foodItem) ??
                                      false;
                                  return FoodChip(
                                    label: foodItem,
                                    isSelected: isSelected,
                                    onTap: () {
                                      context
                                          .read<CustomMealCubit>()
                                          .selectFood(category.key, foodItem);
                                    },
                                  );
                                },
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    );
                  },
                ).toList(),
                SizedBox(height: 32.h),
                MainButton(
                  text: AppStrings.create.tr(),
                  textStyle: AppTextStyle.f24W600SubTitleColor
                      .copyWith(color: AppColors.primaryColor),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MealsScreen(
                          mealName: 'Special meal',
                          mealPrice: 20.99,
                          mealImage: AppImages.specialMeal,
                          mealDescription:
                              'Rice , Broccoli , Chicken,\nOlive , Oils , Peas',
                          calories: '450',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 75.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
