import 'package:convention/core/generic_widgets/back_arrow_widget.dart';
import 'package:convention/core/generic_widgets/custom_meal.dart';
import 'package:convention/core/theme/gradient_class.dart';
import 'package:convention/features/custom_meal/screens/custome_meal2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_text_style.dart';

class YourMeals1 extends StatelessWidget {
  const YourMeals1({super.key});

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
                    AppStrings.yourMeals.tr(),
                    style: AppTextStyle.f32w700White,
                  ),
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                  )
                ],
              ),
              SizedBox(
                height: 64.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Text(
                    textAlign: TextAlign.center,
                    'It is great to prepare your meal according to the nutritional values ​​you want.',
                    style: AppTextStyle.f20w300White
                        .copyWith(color: Colors.white.withOpacity(0.4))),
              ),
              SizedBox(
                height: 76.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nutritional goal',
                    style: AppTextStyle.f32w700White,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomMeal(
                          title: 'Muscle building',
                          description: 'Meals rich in protein and low in fat',
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => YourMeals2(),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: CustomMeal(
                          title: 'Weight loss',
                          description:
                              'Low-calorie, moderate-carbohydrate meals',
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: CustomMeal(
                          title: 'More energy',
                          description: 'Meals rich in carbohydrates',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
