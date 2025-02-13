import 'package:convention/core/constants/data_bank.dart';
import 'package:convention/core/generic_widgets/back_arrow_widget.dart';
import 'package:convention/core/generic_widgets/notification_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_text_style.dart';
import '../../core/theme/gradient_class.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
                      AppStrings.notifications.tr(),
                      style: AppTextStyle.f32w700White,
                    ),
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  height: 500.h,
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      final notification = DataBank.notifications[index];
                      return NotificationWidget(
                        title: notification['title']!,
                        description: notification['description']!,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 16.h,
                      );
                    },
                    itemCount: 5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
