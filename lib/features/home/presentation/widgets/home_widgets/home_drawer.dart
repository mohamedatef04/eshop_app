import 'package:eshop_app/core/theme/app_text_styles.dart';
import 'package:eshop_app/core/theme/app_theme.dart';
import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/features/home/presentation/cubits/languege_toggle_cubit/languege_toggle_cubit.dart';
import 'package:eshop_app/features/home/presentation/cubits/theme_toggle_cubit/theme_toggle_cubit.dart';
import 'package:eshop_app/features/home/presentation/widgets/home_widgets/drawer_header.dart';
import 'package:eshop_app/features/home/presentation/widgets/home_widgets/drawer_menu_item.dart';
import 'package:eshop_app/features/home/presentation/widgets/home_widgets/drawer_switch_item.dart';
import 'package:eshop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  int selectedTheme = 0;
  int selectedLanguage = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final s = S.of(context);

    return Drawer(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      child: Column(
        children: [
          const DrawerHead(),

          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              children: [
                DrawerMenuItem(
                  icon: Icons.local_offer_outlined,
                  title: s.offers,
                  onTap: () {},
                ),
                SizedBox(height: 4.h),
                DrawerMenuItem(
                  icon: Icons.person_outline,
                  title: s.profile,
                  onTap: () {},
                ),
                SizedBox(height: 16.h),

                // Section Label
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    s.settings.toUpperCase(),
                    style: AppTextStyles.bold10(context).copyWith(
                      color: isDark
                          ? Colors.grey.shade600
                          : AppColors.textSecondary,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                // Theme Toggle
                DrawerSwitchItem(
                  icon: isDark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  title: s.theme_mode,
                  value: isDark,
                  onChanged: (value) {
                    final currentTheme = context.read<ThemeToggleCubit>().state;
                    final targetTheme = value
                        ? AppTheme.darkTheme
                        : AppTheme.lightTheme;
                    if (currentTheme != targetTheme) {
                      context.read<ThemeToggleCubit>().toggleTheme(targetTheme);
                    }
                  },
                ),
                SizedBox(height: 12.h),

                // Language Toggle
                DrawerSwitchItem(
                  icon: Icons.translate_rounded,
                  title: s.language,
                  value: isArabic,
                  onChanged: (value) {
                    final currentLanguege = context
                        .read<LanguegeToggleCubit>()
                        .state;
                    final targetLanguege = value
                        ? const Locale('ar')
                        : const Locale('en');
                    if (currentLanguege != targetLanguege) {
                      context.read<LanguegeToggleCubit>().toggleLanguage(
                        targetLanguege,
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          // Logout
          Divider(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.grey.shade200,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: DrawerMenuItem(
              icon: Icons.logout_rounded,
              title: s.logout,
              iconColor: theme.colorScheme.error,
              textColor: theme.colorScheme.error,
              onTap: () {
                // Logout logic
              },
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
