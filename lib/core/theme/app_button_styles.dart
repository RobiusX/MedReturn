import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';

/// Centralized button styles matching the Figma design specifications.
class AppButtonStyles {
  AppButtonStyles._();

  /// Primary pill button (used for "Login")
  /// - Background: Solid Electric Blue (#3B82F6)
  /// - Full pill border radius
  /// - Elevation: 0
  static ButtonStyle get primaryPill => ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.textWhite,
    disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
    disabledForegroundColor: AppColors.textWhite.withValues(alpha: 0.7),
    elevation: 0,
    minimumSize: const Size(double.infinity, AppSpacing.buttonHeight),
    shape: const RoundedRectangleBorder(
      borderRadius: AppSpacing.borderRadiusPill,
    ),
    textStyle: AppTextStyles.button,
  );

  /// Secondary action button (used for "+ Donate Medicine")
  /// - Background: Vibrant Purple (#8B5CF6)
  /// - Border radius: 14-16px (smooth rounded rectangle)
  /// - Elevation: 0
  static ButtonStyle get purpleRounded => ElevatedButton.styleFrom(
    backgroundColor: AppColors.purple,
    foregroundColor: AppColors.textWhite,
    disabledBackgroundColor: AppColors.purple.withValues(alpha: 0.5),
    disabledForegroundColor: AppColors.textWhite.withValues(alpha: 0.7),
    elevation: 0,
    minimumSize: const Size(double.infinity, AppSpacing.buttonHeight),
    shape: const RoundedRectangleBorder(
      borderRadius: AppSpacing.borderRadiusLg,
    ),
    textStyle: AppTextStyles.button,
  );

  /// Text / Link button (used for "Register" prompt)
  static ButtonStyle get textLink => TextButton.styleFrom(
    foregroundColor: AppColors.link,
    padding: EdgeInsets.zero,
    minimumSize: Size.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    textStyle: AppTextStyles.link,
  );
}
