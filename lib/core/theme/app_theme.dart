import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'app_button_styles.dart';
import 'app_card_styles.dart';
import 'app_input_styles.dart';

/// Centralized ThemeData configuration for MedReturn using Material Design 3.
///
/// Ensures pixel-perfect alignment with the Figma design specifications.
class AppTheme {
  AppTheme._();

  /// Light theme — primary theme for MedReturn matching the Figma screens.
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        secondary: AppColors.purple,
        onSecondary: AppColors.onPrimary,
        surface: AppColors.surface,
        error: AppColors.error,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: AppTextStyles.sectionTitle,
      ),
      cardTheme: AppCardStyles.cardTheme,
      inputDecorationTheme: AppInputStyles.inputDecorationTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppButtonStyles.primaryPill,
      ),
      textButtonTheme: TextButtonThemeData(style: AppButtonStyles.textLink),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
      ),
      textTheme: const TextTheme(
        headlineLarge: AppTextStyles.screenHeading,
        headlineMedium: AppTextStyles.greeting,
        titleLarge: AppTextStyles.sectionTitle,
        titleMedium: AppTextStyles.cardTitle,
        bodyLarge: AppTextStyles.inputText,
        bodyMedium: AppTextStyles.screenSubtitle,
        bodySmall: AppTextStyles.cardDescription,
        labelLarge: AppTextStyles.button,
        labelMedium: AppTextStyles.inputLabel,
        labelSmall: AppTextStyles.caption,
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
      scaffoldBackgroundColor: const Color(0xFF111827),
    );
  }
}
