import 'package:convention/core/constants/app_consts.dart';
import 'package:convention/core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'package:convention/core/generic_widgets/category_widget/cubit/category_widget_cubit.dart';
import 'package:convention/core/generic_widgets/custom_text_form_field/cubit/text_form_field_cubit.dart';
import 'package:convention/core/services/notification_service.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_theme_extension.dart';
import 'package:convention/features/authentication/cubit/auth_cubit.dart';
import 'package:convention/features/custom_meal/cubit/custom_meal_cubit.dart';
import 'package:convention/features/home/cubit/cart_cubit.dart';
import 'package:convention/features/home/cubit/profile_cubit.dart';
import 'package:convention/features/splash/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await NotificationService.initNotifications();
  await NotificationService.requestPermission();
  await GetStorage.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
      fontFamily: AppConsts.changa,
      scaffoldBackgroundColor: Colors.transparent,
      extensions: [
        AppThemeExtension(
          gradientBackground: const LinearGradient(
            colors: [
              AppColors.firstGradientColor,
              AppColors.secondGradientColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ],
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) {
              return TextFormFieldCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return BottomNavigationCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return AuthCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return CategoryCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return CartCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return ProfileCubit();
            },
          ),
          BlocProvider(
            create: (BuildContext context) {
              return CustomMealCubit();
            },
          ),
        ],
        child: MaterialApp(
          theme: themeData,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
