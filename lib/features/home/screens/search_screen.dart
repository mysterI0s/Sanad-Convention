import 'package:convention/core/constants/data_bank.dart';
import 'package:convention/core/generic_widgets/custom_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/gradient_class.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              children: [
                Center(
                  child: Text(
                    AppStrings.search.tr(),
                    style: AppTextStyle.f32w700White,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 56.h,
                      width: 290.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
                          ),
                          fillColor: AppColors.subTitleColor,
                          filled: true,
                          hintText: AppStrings.pizza,
                          hintStyle: AppTextStyle.f16w200subTitleColorOpacity30
                              .copyWith(color: AppColors.subTitleColor),
                          suffixIcon: const TextFormFieldSvg(
                            image: AppImages.search,
                            place: Alignment.centerLeft,
                          ),
                          prefixIcon: const TextFormFieldSvg(
                            image: AppImages.cross,
                            place: Alignment.centerRight,
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.r),
                        ),
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.subTitleColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppImages.alignCenter,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 47.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: DataBank.categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          final category = DataBank.categories[index];
                          return Container(
                            height: 46.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: Center(
                                child: Text(
                                  category['name']!,
                                  style: AppTextStyle
                                      .f16w200subTitleColorOpacity30
                                      .copyWith(color: AppColors.subTitleColor),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 10.w);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                SizedBox(
                  height: 500.h,
                  width: 380.w,
                  child: Lottie.asset(AppImages.astronaut, fit: BoxFit.cover),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
