import 'package:convention/features/favorite_meals/cubit/favorite_meals_cubit.dart';
import 'package:convention/features/favorite_meals/cubit/favorite_meals_state.dart';
import 'package:convention/features/home/cubit/cart_cubit.dart';
import 'package:convention/features/home/cubit/cart_state.dart';
import 'package:convention/features/meals_details/cubit/meals_cubit.dart';
import 'package:convention/features/meals_details/cubit/meals_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:convention/core/generic_widgets/back_arrow_widget.dart';
import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:convention/core/theme/gradient_class.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/generic_widgets/meals_details_widgets.dart';

class MealsScreen extends StatelessWidget {
  final String mealName;
  final double mealPrice;
  final String mealImage;
  final String mealDescription;
  final String calories;

  const MealsScreen({
    super.key,
    required this.mealName,
    required this.mealPrice,
    required this.mealImage,
    required this.mealDescription,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealCubit(mealPrice),
      child: BlocProvider(
        create: (context) => FavoriteMealsCubit(),
        child: GradientBackground(
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ArrowBackWidget(),
                          Text(
                            AppStrings.mealsDetails.tr(),
                            style: AppTextStyle.f32w700White,
                          ),
                          BlocBuilder<FavoriteMealsCubit, FavoriteMealsState>(
                            builder: (context, state) {
                              final isFavorite = state.favoriteMeals
                                  .any((item) => item.title == mealName);
                              return GestureDetector(
                                onTap: () {
                                  final mealItem = CartItem(
                                    title: mealName,
                                    price: mealPrice,
                                    quantity: 1,
                                    imagePath: mealImage,
                                    description: mealDescription,
                                    calories: calories,
                                  );
                                  context
                                      .read<FavoriteMealsCubit>()
                                      .toggleFavorite(mealItem);
                                },
                                child: SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: SvgPicture.asset(
                                    isFavorite
                                        ? AppImages.hearted
                                        : AppImages.heart,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 300.h,
                        child: Image(
                          image: AssetImage(
                            mealImage,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                mealName.tr(),
                                style: AppTextStyle.f24W600SubTitleColor,
                              ),
                              BlocBuilder<MealCubit, MealState>(
                                builder: (context, state) {
                                  return Container(
                                    width: 104.w,
                                    height: 32.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.subTitleColor,
                                      borderRadius: BorderRadius.circular(
                                        32.r,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () => context
                                              .read<MealCubit>()
                                              .increment(mealPrice),
                                          icon: const Icon(Icons.add),
                                        ),
                                        Text('${state.quantity}'),
                                        IconButton(
                                          onPressed: () => context
                                              .read<MealCubit>()
                                              .decrement(mealPrice),
                                          icon: const Icon(Icons.remove),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            width: double.infinity,
                            height: 72.h,
                            decoration: BoxDecoration(
                                color: AppColors.purpleColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InfoRow(text: '4.5', image: AppImages.star),
                                VerticalDivider(),
                                InfoRow(text: 'Free', image: AppImages.clock),
                                VerticalDivider(),
                                InfoRow(text: '20 min', image: AppImages.truck),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: double.infinity,
                            height: 72.h,
                            decoration: BoxDecoration(
                                color: AppColors.purpleColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                mealDescription,
                                style: AppTextStyle.f20w400SubTitle,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SpecificsContainer(
                                  num: calories, text: 'Calories'),
                              SpecificsContainer(num: '60', text: 'Fats'),
                              SpecificsContainer(num: '18%', text: 'Protein'),
                              SpecificsContainer(num: '66', text: 'Carbs'),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Anything else we need to know?',
                            style: AppTextStyle.f20w400SubTitle,
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            decoration: InputDecoration(
                              fillColor: AppColors.purpleColor,
                              filled: true,
                              hintText: 'Note.....',
                              hintStyle: AppTextStyle.f20w400SubTitle.copyWith(
                                  color: Colors.white.withOpacity(0.5)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            width: double.infinity,
                            height: 58.h,
                            decoration: BoxDecoration(
                              color: AppColors.subTitleColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: BlocBuilder<MealCubit, MealState>(
                                builder: (context, state) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$ ${state.totalPrice.toStringAsFixed(2)}',
                                        style: AppTextStyle.f20W600PrimaryColor,
                                      ),
                                      Container(
                                        height: 40.h,
                                        width: 140.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.yellowColor,
                                          borderRadius:
                                              BorderRadius.circular(48),
                                        ),
                                        child: Center(
                                          // ✅ Ensures the button is centered
                                          child: TextButton(
                                            onPressed: () {
                                              final newItem = CartItem(
                                                imagePath: mealImage,
                                                title: mealName,
                                                price: mealPrice,
                                                quantity: state.quantity,
                                                description: mealDescription,
                                                calories: calories,
                                              );
                                              context
                                                  .read<CartCubit>()
                                                  .addToCart(newItem);
                                            },
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets
                                                  .zero,
                                              minimumSize: Size(140.w,
                                                  40.h),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(48),
                                              ),
                                            ),
                                            child: Text(
                                              "Add To Cart",
                                              style: AppTextStyle
                                                  .f20W600PrimaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
