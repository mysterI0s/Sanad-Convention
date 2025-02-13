import 'package:convention/core/theme/gradient_class.dart';
import 'package:convention/features/authentication/cubit/auth_cubit.dart';
import 'package:convention/features/authentication/cubit/auth_state.dart';
import 'package:convention/features/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:convention/core/constants/app_consts.dart';
import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/constants/app_strings.dart';
import 'package:convention/core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:convention/core/generic_widgets/main_button.dart';
import 'package:convention/core/theme/app_colors.dart';
import 'package:convention/core/theme/app_text_style.dart';
import 'package:convention/features/authentication/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: GradientBackground(
        child: Scaffold(
          body: SafeArea(
            child: SizedBox.expand(
              child: Stack(
                children: [
                  SizedBox(
                    height: 308.h,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            AppImages.logo,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          AppStrings.welcomeBackPleaseLoginToYourAccount.tr(),
                          style: AppTextStyle.f16W400SubTitleColor.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.32,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 32.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                              hintText: AppStrings.phoneNumber.tr(),
                              controller: phoneController,
                            ),
                            SizedBox(height: 20.h),
                            CustomTextFormField(
                              hintText: "Password",
                              isPassword: true,
                              controller: passwordController,
                            ),
                            SizedBox(height: 16.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppStrings.forgotPassword.tr(),
                                  style: AppTextStyle.f16W300RedColor,
                                ),
                              ),
                            ),
                            SizedBox(height: 32.h),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is LoginSuccessState) {
                                  box.write(AppConsts.isLoggedIn, true);
                                  box.write('phoneNumber', state.phoneNumber);
                                  box.write('userName', state.name);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        AppStrings.loggedInSuccessfully.tr(),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BaseScreen(),
                                      ),
                                      (Route<dynamic> route) => false,
                                    );
                                  });
                                } else if (state is LoginErrorState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        state.errorMsg,
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is LoginLoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return MainButton(
                                  text: AppStrings.login.tr(),
                                  onPressed: () {
                                    final phone = phoneController.text.trim();
                                    final password =
                                        passwordController.text.trim();
                                    if (phone.isEmpty || password.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            AppStrings.pleaseFillAllFields.tr(),
                                            style: AppTextStyle
                                                .f16W400SubTitleColor,
                                          ),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      context
                                          .read<AuthCubit>()
                                          .login(phone, password);
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 70.w,
                                  child: const Divider(),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    "OR",
                                    style: AppTextStyle.f14W600OrColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 70.w,
                                  child: const Divider(),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 16.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 1.w,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      8.r,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      AppImages.google,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.w,
                                    vertical: 16.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 1.w,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      8.r,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      AppImages.facebook,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.doNotHaveAccount.tr(),
                                  style: AppTextStyle.f20W500PrimaryColor,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    AppStrings.signup.tr(),
                                    style: AppTextStyle.f20W500PrimaryColor
                                        .copyWith(
                                      color: AppColors.yellowColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
