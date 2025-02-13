import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final LinearGradient gradientBackground;

  AppThemeExtension({required this.gradientBackground});

  @override
  AppThemeExtension copyWith({LinearGradient? gradientBackground}) {
    return AppThemeExtension(
      gradientBackground: gradientBackground ?? this.gradientBackground,
    );
  }

  @override
  AppThemeExtension lerp(AppThemeExtension other, double t) {
    return AppThemeExtension(
      gradientBackground:
          LinearGradient.lerp(gradientBackground, other.gradientBackground, t)!,
    );
  }
}
