import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/features/authentication/screens/sign_in_screen.dart';
import 'package:convention/features/base/base_screen.dart';
import 'package:convention/features/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool isLoggedIn = box.read(AppConsts.isLoggedIn) ?? false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 7), () {
      if ((box.read(AppConsts.isFirstOpen) ?? true) == true) {
        box.write(AppConsts.isFirstOpen, false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => isLoggedIn ? BaseScreen() : SignInScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image(
          image: AssetImage(
            AppImages.splash,
          ),
        ),
      ),
    );
  }
}
