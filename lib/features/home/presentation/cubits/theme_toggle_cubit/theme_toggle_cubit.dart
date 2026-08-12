import 'package:eshop_app/core/theme/app_theme.dart';
import 'package:eshop_app/core/utils/safe_emit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggleCubit extends Cubit<ThemeData> {
  ThemeToggleCubit() : super(AppTheme.lightTheme);

  void toggleTheme(ThemeData theme) {
    safeEmit(theme);
  }
}
