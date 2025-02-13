import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/constants/data_bank.dart';
import 'package:convention/core/generic_widgets/back_arrow_widget.dart';
import 'package:convention/core/generic_widgets/meals_card.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:convention/core/theme/gradient_class.dart';
import 'package:convention/features/meals_details/meals_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAllMeals extends StatelessWidget {
  const SeeAllMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ArrowBackWidget(),
                    Text(
                      AppStrings.meals.tr(),
                      style: AppTextStyle.f32w700White,
                    ),
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  height: 660.h,
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      final meal = DataBank.seeAllMeals[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MealsScreen(
                                calories: meal['calories']!,
                                mealName: meal['name']!,
                                mealPrice: double.parse(meal['price']!),
                                mealImage: meal['imagePath']!,
                                mealDescription: meal['description']!,
                              ),
                            ),
                          );
                        },
                        child: MealsCard(
                          image: meal['imagePath']!,
                          title: meal['name']!,
                          // subtitle: meal['shop']!,
                          description: meal['description']!,
                          calories: meal['calories']!,
                          price: '\$${meal['price']}',
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 16.h);
                    },
                    itemCount: DataBank.seeAllMeals.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
