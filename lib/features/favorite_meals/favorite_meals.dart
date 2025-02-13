import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/generic_widgets/back_arrow_widget.dart';
import 'package:convention/core/generic_widgets/meals_card.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:convention/core/theme/gradient_class.dart';
import 'package:convention/features/favorite_meals/cubit/favorite_meals_cubit.dart';
import 'package:convention/features/favorite_meals/cubit/favorite_meals_state.dart';
import 'package:convention/features/meals_details/meals_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteMealsScreen extends StatelessWidget {
  const FavoriteMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteMealsCubit(),
      child: GradientBackground(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(children: [
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
                BlocBuilder<FavoriteMealsCubit, FavoriteMealsState>(
                  builder: (context, state) {
                    if (state.favoriteMeals.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            'No favorite meals yet!',
                            style: AppTextStyle.f24w500Yellow,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                    return SizedBox(
                      height: 660.h,
                      child: ListView.separated(
                        padding: EdgeInsets.all(16.r),
                        itemCount: state.favoriteMeals.length,
                        itemBuilder: (context, index) {
                          final meal = state.favoriteMeals[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MealsScreen(
                                    mealName: meal.title,
                                    mealPrice: meal.price,
                                    mealImage: meal.imagePath,
                                    mealDescription: meal.description,
                                    calories: meal.calories,
                                  ),
                                ),
                              );
                            },
                            child: MealsCard(
                              title: meal.title,
                              price: '\$${meal.price}',
                              image: meal.imagePath,
                              // subtitle: 'Delicious space meal!',
                              description: meal.description,
                              calories: meal.calories,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 24,
                          );
                        },
                      ),
                    );
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
