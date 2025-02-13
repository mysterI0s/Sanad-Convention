import 'dart:io';

import 'package:convention/core/constants/app_consts.dart';
import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/constants/data_bank.dart';
import 'package:convention/core/generic_widgets/category_widget/category_widget.dart';
import 'package:convention/core/generic_widgets/coupon_swiper.dart';
import 'package:convention/core/generic_widgets/innovative_meal_widget.dart';
import 'package:convention/core/generic_widgets/main_button.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:convention/core/theme/gradient_class.dart';
import 'package:convention/features/custom_meal/screens/custom_meal1.dart';
import 'package:convention/features/home/screens/see_all_meals.dart';
import 'package:convention/features/meals_details/cubit/meals_cubit.dart';
import 'package:convention/features/meals_details/meals_details_screen.dart';
import 'package:convention/features/notifications/notifications_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = box.read<String>('userName') ?? 'Sanad';
    final String? profileImagePath = box.read<String>('profileImage');

    return GradientBackground(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: profileImagePath != null &&
                                File(profileImagePath).existsSync()
                            ? FileImage(
                                File(profileImagePath),
                              )
                            : null,
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '${AppStrings.welcome.tr()}, $userName',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: SvgPicture.asset(
                          AppImages.notification,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CouponSwiper(),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    AppStrings.category.tr(),
                    style: AppTextStyle.f16w600White.copyWith(fontSize: 22),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 80.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: DataBank.categories.length,
                      itemBuilder: (context, index) {
                        final category = DataBank.categories[index];
                        return CategoryWidget(
                          name: category['name']!,
                          index: index,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 8.w);
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.innovativeMeals.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SeeAllMeals(),
                            ),
                          );
                        },
                        child: Text(
                          AppStrings.seeAll.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 280.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: DataBank.seeAllMeals.length,
                      itemBuilder: (context, index) {
                        final meal = DataBank.seeAllMeals[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => MealCubit(
                                    double.parse(meal['price']!),
                                  ),
                                  child: MealsScreen(
                                    calories: meal['calories']!,
                                    mealDescription: meal['description']!,
                                    mealName: meal['name']!,
                                    mealPrice: double.parse(meal['price']!),
                                    mealImage: meal['imagePath']!,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: InnovativeMealWidget(
                            imagePath: meal['imagePath']!,
                            title: meal['name']!.tr(),
                            price: '\$${meal['price']}',
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 8.w);
                      },
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.customContainerColor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 140.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.prepareMealQuestion.tr(),
                                    style: AppTextStyle.f16W400SubTitleColor,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10.h),
                                  MainButton(
                                    text: AppStrings.letsGo.tr(),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => YourMeals1(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -20.h,
                        left: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Container(
                            width: 180.w,
                            height: 200.h,
                            child: Image(
                              image: AssetImage(
                                AppImages.customMeal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.specialGifts.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.seeAll.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 280.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: DataBank.specialGifts.length,
                      itemBuilder: (context, index) {
                        final specialGift = DataBank.specialGifts[index];
                        return InnovativeMealWidget(
                          imagePath: specialGift['imagePath']!,
                          title: specialGift['name']!,
                          price: '\$${specialGift['price']!}',
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 8.w);
                      },
                    ),
                  ),
                  Container(
                    height: 86.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 80.h,
                          width: 80.w,
                          child: Image.asset(
                            AppImages.wheel,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          AppStrings.spaceMissions.tr(),
                          style: AppTextStyle.f24W600SubTitleColor,
                        ),
                        SizedBox(
                          width: 24.w,
                          height: 24.h,
                          child: SvgPicture.asset(
                            AppImages.chevronRightDouble,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
