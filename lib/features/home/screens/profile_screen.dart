import 'dart:io';

import 'package:convention/core/constants/app_consts.dart';
import 'package:convention/features/authentication/screens/sign_in_screen.dart';
import 'package:convention/features/base/base_screen.dart';
import 'package:convention/features/favorite_meals/favorite_meals.dart';
import 'package:convention/features/home/cubit/profile_cubit.dart';
import 'package:convention/features/home/cubit/profile_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/constants/app_strings.dart';
import '../../../core/generic_widgets/profile_box.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../../../core/theme/gradient_class.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final String userName = box.read<String>('userName') ?? 'Sanad';
    final String phoneNumber = box.read('phoneNumber') ?? '0994408530';
    return GradientBackground(
      child: BlocProvider(
        create: (context) => ProfileCubit(),
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.0.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BaseScreen(),
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(AppImages.chevronLeft),
                              ),
                              BlocBuilder<ProfileCubit, ProfileState>(
                                builder: (BuildContext context, state) {
                                  final String? imagePath =
                                      box.read<String>('profileImage');
                                  return GestureDetector(
                                    onTap: () {
                                      context.read<ProfileCubit>().pickImage();
                                    },
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor:
                                          AppColors.secondGradientColor,
                                      backgroundImage: imagePath != null
                                          ? FileImage(File(imagePath))
                                          : null,
                                      child: imagePath == null
                                          ? Icon(Icons.camera_alt,
                                              color: Colors.white)
                                          : null,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 24.h,
                                width: 24.w,
                              )
                            ],
                          ),
                          Text(
                            userName,
                            style: AppTextStyle.f32w700White,
                          ),
                          Text(
                            phoneNumber,
                            style: AppTextStyle.f20w300White
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      children: [
                        ProfileBoxes(
                          onPressed1: () {},
                          onPressed2: () {},
                          onPressed3: () {
                            final currentLocale = context.locale;
                            if (currentLocale.languageCode == 'en') {
                              context.setLocale(const Locale('ar'));
                            } else {
                              context.setLocale(const Locale('en'));
                            }
                          },
                          onPressed4: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FavoriteMealsScreen(),
                              ),
                            );
                          },
                          text1: AppStrings.personalInfo.tr(),
                          text2: AppStrings.addresses.tr(),
                          text3: AppStrings.language.tr(),
                          text4: AppStrings.favorite.tr(),
                          svg1: AppImages.profile,
                          svg2: AppImages.map,
                          svg3: AppImages.language,
                          svg4: AppImages.heartProfile,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ProfileBoxes(
                          visible3: false,
                          visible4: false,
                          onPressed1: () {},
                          onPressed2: () {},
                          text1: AppStrings.monthlySubscription.tr(),
                          text2: AppStrings.paymentMethod.tr(),
                          svg1: AppImages.calender,
                          svg2: AppImages.wallet,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ProfileBoxes(
                          onPressed1: () {},
                          onPressed2: () {},
                          onPressed3: () {},
                          text1: AppStrings.helpCenter.tr(),
                          text2: AppStrings.termsPolices.tr(),
                          text3: AppStrings.aboutTheApp.tr(),
                          svg1: AppImages.iconDisc,
                          svg2: AppImages.infoCircle,
                          svg3: AppImages.iconBook,
                          visible4: false,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ProfileBoxes(
                          onPressed1: () {
                            box.write(AppConsts.isLoggedIn, false);
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          text1: AppStrings.logout.tr(),
                          svg1: AppImages.logout,
                          visible2: false,
                          visible3: false,
                          visible4: false,
                        ),
                        SizedBox(
                          height: 120.h,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
