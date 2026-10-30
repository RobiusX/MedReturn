import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Application theme configuration.
///
/// Defines the visual appearance of the MedReturn app including
/// colors, typography, and component themes. Both light and dark
/// variants are provided.
class AppTheme {
  AppTheme._();

  /// Light theme — the default theme for MedReturn.
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
    );
  }

  /// Dark theme — for future dark mode support.
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
    );
  }
}

