import 'package:flutter/material.dart';
import 'colors.dart';

abstract class AppTheme {
  static final ColorScheme _scheme = ColorScheme.dark(
    primary: AppColors.primary,
    surface: AppColors.background,
    onPrimary: AppColors.onPrimary,
    onSurface: AppColors.onBackground,
  );

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _scheme,
      scaffoldBackgroundColor: _scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: _scheme.primary,
        foregroundColor: _scheme.onPrimary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _scheme.primary,
        foregroundColor: _scheme.onPrimary,
      )
    );
  }
}