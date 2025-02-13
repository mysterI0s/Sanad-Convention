import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/app_colors.dart';

class FoodChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FoodChip({
    required this.label,
    this.isSelected = false,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.yellowColor : AppColors.purpleColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          label,
          style: TextStyle(
            color:
                isSelected ? AppColors.primaryColor : AppColors.subTitleColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
