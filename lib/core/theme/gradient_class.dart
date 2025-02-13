import 'package:convention/core/constants/app_images.dart';
import 'package:convention/core/theme/app_theme_extension.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppThemeExtension>();

    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            AppImages.backgroundGif,
          ),
        ),
        gradient: theme?.gradientBackground ??
            const LinearGradient(colors: [Colors.black, Colors.black]),
      ),
      child: child,
    );
  }
}
