import 'package:flutter/material.dart';

/// Breakpoint utilities for responsive design
class ResponsiveUtils {
  // Breakpoint constants
  static const double smallPhoneMaxWidth = 360;
  static const double mediumPhoneMaxWidth = 400;
  static const double largePhoneMaxWidth = 600;
  static const double tabletMaxWidth = 900;

  /// Device type detection
  static bool isSmallPhone(BuildContext context) =>
      MediaQuery.sizeOf(context).width < smallPhoneMaxWidth;

  static bool isMediumPhone(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= smallPhoneMaxWidth &&
      MediaQuery.sizeOf(context).width < mediumPhoneMaxWidth;

  static bool isLargePhone(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mediumPhoneMaxWidth &&
      MediaQuery.sizeOf(context).width < largePhoneMaxWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= largePhoneMaxWidth &&
      MediaQuery.sizeOf(context).width < tabletMaxWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletMaxWidth;

  static bool isTabletOrLarger(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= largePhoneMaxWidth;

  /// Responsive value based on screen width
  static T responsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= tabletMaxWidth && desktop != null) return desktop;
    if (width >= largePhoneMaxWidth && tablet != null) return tablet;
    return mobile;
  }

  /// Calculate responsive horizontal padding based on screen width
  static double responsiveHorizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < smallPhoneMaxWidth) return 12;
    if (width < largePhoneMaxWidth) return 20;
    if (width < tabletMaxWidth) return 32;
    return 48;
  }

  /// Calculate responsive vertical spacing based on screen width
  static double responsiveVerticalSpacing(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < smallPhoneMaxWidth) return 16;
    if (width < largePhoneMaxWidth) return 20;
    return 24;
  }

  /// Calculate max content width for centering on large screens
  static double? maxContentWidth(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= tabletMaxWidth) return 900;
    if (width >= largePhoneMaxWidth) return 700;
    return null; // No constraint on phones
  }

  /// Calculate responsive font scale factor
  static double fontScaleFactor(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    // Base scale factor based on width
    if (width < 320) return 0.8; // Very small phones
    if (width < smallPhoneMaxWidth) return 0.9; // Small phones
    if (width >= tabletMaxWidth) return 1.25; // Desktop
    if (width >= largePhoneMaxWidth) return 1.15; // Tablet
    return 1.0; // Standard phones
  }

  /// Scale a value based on the design width (default: 375 as used in previous config)
  /// This is a fallback for when you still want proportional scaling on phones.
  static double scaled(BuildContext context, double value) {
    final width = MediaQuery.sizeOf(context).width;
    // Only scale proportionally on phones, cap it for larger screens to prevent huge sizes
    if (width >= largePhoneMaxWidth) {
      return value * 1.1; // Slight bump for tablets instead of huge scaling
    }
    return value * (width / 375.0);
  }

  /// Calculate responsive icon size
  static double responsiveIconSize(BuildContext context, {double base = 24}) {
    final scale = fontScaleFactor(context);
    return base * scale;
  }

  /// Calculate responsive button height
  static double responsiveButtonHeight(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < smallPhoneMaxWidth) return 44;
    if (width >= tabletMaxWidth) return 56;
    return 50;
  }

  /// Get responsive EdgeInsets for cards/containers
  static EdgeInsets responsiveCardPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < smallPhoneMaxWidth) {
      return const EdgeInsets.all(10);
    }
    if (width >= tabletMaxWidth) {
      return const EdgeInsets.all(20);
    }
    return const EdgeInsets.all(16);
  }
}
