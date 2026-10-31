import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';

/// Centralized text field and input decoration styles matching the Figma design.
class AppInputStyles {
  AppInputStyles._();

  /// Default InputDecorationTheme for the global ThemeData.
  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputBg,
    hintStyle: AppTextStyles.inputHint,
    contentPadding: AppSpacing.inputContentPadding,
    prefixIconColor: AppColors.inputIcon,
    border: OutlineInputBorder(
      borderRadius: AppSpacing.borderRadiusMd,
      borderSide: const BorderSide(color: AppColors.inputBorder, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: AppSpacing.borderRadiusMd,
      borderSide: const BorderSide(color: AppColors.inputBorder, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: AppSpacing.borderRadiusMd,
      borderSide: const BorderSide(
        color: AppColors.inputBorderFocused,
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: AppSpacing.borderRadiusMd,
      borderSide: const BorderSide(color: AppColors.error, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: AppSpacing.borderRadiusMd,
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );

  /// Helper to generate a styled InputDecoration for individual text fields.
  static InputDecoration fieldDecoration({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }
}
