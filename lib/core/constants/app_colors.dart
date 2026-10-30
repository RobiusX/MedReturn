import 'package:flutter/material.dart';

/// Centralized color palette for the MedReturn application.
///
/// All color values used throughout the app should be defined here
/// to ensure visual consistency and easy theme updates.
class AppColors {
  AppColors._();

  // Primary colors — medical teal/green
  static const Color primary = Color(0xFF2E7D6F);
  static const Color primaryLight = Color(0xFF5BACA0);
  static const Color primaryDark = Color(0xFF004F42);

  // Secondary colors
  static const Color secondary = Color(0xFF4A90D9);
  static const Color secondaryLight = Color(0xFF7FB8FF);
  static const Color secondaryDark = Color(0xFF0064A7);

  // Neutral colors
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);

  // Status colors
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFDC3545);
  static const Color info = Color(0xFF17A2B8);
}

