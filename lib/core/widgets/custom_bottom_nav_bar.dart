import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.3)
                : Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GNav(
        backgroundColor: Colors.transparent,
        tabMargin: EdgeInsets.symmetric(
          vertical: 5.h,
        ), // Removed horizontal margin to fix overflow
        tabBorderRadius: 20.r,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 200),
        gap: 6, // Reduced gap between icon and text to save space
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        activeColor: Colors.white,
        tabBackgroundGradient: const LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
        ),
        iconSize: 24,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ), // Reduced horizontal padding
        onTabChange: (value) {},
        tabs: [
          GButton(
            icon: CupertinoIcons.home,
            text: S.of(context).home,
          ),
          GButton(
            icon: CupertinoIcons.compass,
            text: S.of(context).discover,
          ),
          GButton(
            icon: CupertinoIcons.cart,
            text: S.of(context).cart,
          ),
          GButton(
            icon: CupertinoIcons.person,
            text: S.of(context).profile,
          ),
        ],
      ),
    );
  }
}
