import 'package:eshop_app/core/theme/colors.dart';
import 'package:eshop_app/core/theme/responsive_utils.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static double _getFontSize(BuildContext context, double baseSize) {
    return baseSize * ResponsiveUtils.fontScaleFactor(context);
  }

  static String _fontFamily(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return locale == 'ar' ? 'Vazirmatn' : 'Manrope';
  }

  //* Bold Styles

  static TextStyle bold30(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 30),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold28(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 28),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold26(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 26),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold24(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 24),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold22(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 22),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold20(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 20),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold18(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 18),
    color: Colors.white,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold16(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 16),
    color: AppColors.black,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold14(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 14),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );
  static TextStyle bold12(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 12),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold10(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 10),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.bold,
  );

  //*Semi Bold Styles
  static TextStyle semiBold26(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 26),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold24(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 24),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold22(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 22),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold20(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 20),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold18(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 18),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold16(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 16),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold14(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 14),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold12(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 12),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w600,
  );

  //* Medium Styles
  static TextStyle medium30(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 30),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium28(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 28),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium26(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 26),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium24(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 24),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium22(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 22),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium20(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 20),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium18(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 18),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium16(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 16),
    color: Theme.of(context).colorScheme.onPrimary,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium14(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 14),
    color: Theme.of(context).colorScheme.onSecondary,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium12(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 12),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium10(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 10),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w500,
  );

  //*Regular Styles

  static TextStyle regular36(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 36),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular30(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 30),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular28(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 28),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular26(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 26),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular24(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 24),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular22(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 22),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular20(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 20),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular18(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 18),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular16(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 16),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular14(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 14),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular12(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 12),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular10(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 10),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w400,
  );

  //* Light Styles
  static TextStyle light30(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 30),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light28(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 28),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light26(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 26),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light24(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 24),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light22(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 22),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light20(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 20),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light18(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 18),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light16(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 16),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light14(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 14),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light12(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 12),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
  static TextStyle light10(BuildContext context) => TextStyle(
    fontSize: _getFontSize(context, 10),
    color: Theme.of(context).colorScheme.onSurface,
    fontFamily: _fontFamily(context),
    fontWeight: FontWeight.w300,
  );
}
