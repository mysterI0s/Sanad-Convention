import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/gradient_class.dart';
import 'package:convention/features/authentication/screens/sign_in_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/generic_widgets/main_button.dart';
import 'package:convention/core/generic_widgets/onboarding_page_widget.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:convention/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController pageController = PageController();

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: GradientBackground(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  return (state.currentPage == 0 || state.currentPage == 1)
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0.w,
                            vertical: 32.0.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  AppStrings.skip.tr(),
                                  style: AppTextStyle.f24W600SubTitleColor
                                      .copyWith(
                                    color: AppColors.yellowColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    context.read<OnboardingCubit>().updatePage(index);
                  },
                  children: const [
                    OnboardingPageWidget(
                      imagePath: AppImages.plate,
                      title: 'Creativity Space Station',
                      description:
                          'Welcome to the space creativity glimpse where you control your meal between the planets',
                    ),
                    OnboardingPageWidget(
                      imagePath: AppImages.roulette,
                      title: 'Space Missions',
                      description:
                          'Here begins your space adventures. Participate in weekly challenges to earn points that raise your ranking and unlock hidden abilities.',
                    ),
                    OnboardingPageWidget(
                      imagePath: AppImages.store,
                      title: 'Galaxy Store',
                      description: 'Discover pieces of the unknown',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: const WormEffect(
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        activeDotColor: AppColors.indicatiorColor,
                        dotColor: AppColors.white,
                        spacing: 8.0,
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    BlocBuilder<OnboardingCubit, OnboardingState>(
                      builder: (context, state) {
                        return MainButton(
                          text: state.currentPage == 2
                              ? AppStrings.getStarted.tr()
                              : AppStrings.next.tr(),
                          minWidth: double.infinity,
                          onPressed: () {
                            if (state.currentPage == 2) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                            } else {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              context.read<OnboardingCubit>().nextPage();
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
