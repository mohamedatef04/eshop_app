import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class DrawerHead extends StatelessWidget {
  const DrawerHead({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 24.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  AppColors.primary.withValues(alpha: 0.3),
                  AppColors.backgroundDark,
                ]
              : [
                  AppColors.primary.withValues(alpha: 0.12),
                  AppColors.background,
                ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
            ),
            child: CircleAvatar(
              radius: 32.r,
              backgroundColor: isDark
                  ? AppColors.backgroundDark
                  : AppColors.surface,
              child: Icon(
                Icons.person_rounded,
                size: 34.sp,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(height: 14.h),
          Text(
            'Jane Doe',
            style: AppTextStyles.bold18(context).copyWith(
              color: isDark ? Colors.white : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'jane@example.com',
            style: AppTextStyles.regular12(context).copyWith(
              color: isDark ? Colors.grey.shade500 : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
