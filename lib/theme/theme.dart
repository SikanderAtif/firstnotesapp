import 'package:flutter/material.dart';
import 'colors.dart';

abstract class AppTheme {
  static final ColorScheme _darkScheme = ColorScheme.dark(
    primary: AppColors.primaryDark,
    surface: AppColors.backgroundDark,
    onPrimary: AppColors.onPrimaryDark,
    onSurface: AppColors.onBackgroundDark,
  );

  static final ColorScheme _lightScheme = ColorScheme.light(
    primary: AppColors.primaryLight,
    surface: AppColors.backgroundLight,
    onPrimary: AppColors.onPrimaryLight,
    onSurface: AppColors.onBackgroundLight,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _darkScheme,
      scaffoldBackgroundColor: _darkScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: _darkScheme.primary,
        foregroundColor: _darkScheme.onPrimary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _darkScheme.primary,
        foregroundColor: _darkScheme.onPrimary,
      )
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _lightScheme,
      scaffoldBackgroundColor: _lightScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: _lightScheme.primary,
        foregroundColor: _lightScheme.onPrimary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightScheme.primary,
        foregroundColor: _lightScheme.onPrimary,
      )
    );
  }
}