import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class DrawerSwitchItem extends StatelessWidget {
  const DrawerSwitchItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
    this.iconColor,
    this.textColor,
  });

  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12.r),
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
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
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
