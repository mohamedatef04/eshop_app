import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: (iconColor ?? AppColors.secondary).withValues(
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  icon,
                  size: 20.sp,
                  color: iconColor ?? AppColors.secondary,
                ),
              ),
              SizedBox(width: 14.w),
              Text(
                title,
                style: AppTextStyles.semiBold14(context).copyWith(
                  color: textColor ?? Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.chevron_right_rounded,
                size: 20.sp,
                color: isDark ? Colors.grey.shade700 : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
