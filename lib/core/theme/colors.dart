import 'package:flutter/material.dart';

/// Application Color Constants
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFFFEFAE0);
  static const Color primaryDark = Color(0xFFDDB866);
  static const Color primaryLight = Color(0xFFFFDAB9);

  // Secondary Colors
  static const Color secondary = Color(0xFFF08E42);
  static const Color secondaryDark = Color(0xFFB88E66);
  static const Color secondaryLight = Color(0xFFF2E0C3);

  // Accent Colors
  static const Color accent = Color(0xFFDDB866);
  static const Color accentDark = Color(0xFFB88E66);
  static const Color accentLight = Color(0xFFF2E0C3);

  // Background Colors
  static const Color background = Color(0xFFFEFAE0);
  static const Color backgroundDark = Color(0xff1D182A);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF16213E);

  // Text Colors
  static const Color textPrimary = Color(0xFF3A3333);
  static const Color textSecondary = Color(0xFF9C8162);
  static const Color textLight = Color(0xFFDDB866);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF00B894);
  static const Color warning = Color(0xFFFDAA5D);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF74B9FF);

  // Border & Divider Colors
  static const Color border = Color(0xFFDFE6E9);
  static const Color divider = Color(0xFFECF0F1);

  // Card & Container Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF0047AB);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, Color(0xFFF5576C)],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [backgroundDark, surfaceDark],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
  );
}
