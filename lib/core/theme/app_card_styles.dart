import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';

/// Centralized card decorations, borders, and shadows matching the Figma design.
class AppCardStyles {
  AppCardStyles._();

  /// Default CardThemeData for the global ThemeData.
  static CardThemeData get cardTheme => CardThemeData(
    color: AppColors.cardBackground,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: AppSpacing.borderRadiusLg,
      side: const BorderSide(color: AppColors.cardBorder, width: 1.0),
    ),
  );

  /// Standard white card decoration with soft border and subtle ambient shadow.
  static BoxDecoration get standardCard => BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: AppSpacing.borderRadiusLg,
    border: Border.all(color: AppColors.cardBorder, width: 1.0),
    boxShadow: const [
      BoxShadow(
        color: Color(0x08000000), // ~3% opacity black shadow
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  );

  /// Stat card decoration (used on the Dashboard).
  static BoxDecoration get statCard => BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: AppSpacing.borderRadiusLg,
    border: Border.all(color: AppColors.cardBorder, width: 1.0),
    boxShadow: const [
      BoxShadow(color: Color(0x06000000), blurRadius: 6, offset: Offset(0, 2)),
    ],
  );

  /// Brand logo pill container decoration (Blue -> Purple gradient).
  static BoxDecoration get logoPill => const BoxDecoration(
    gradient: AppColors.logoGradient,
    borderRadius: AppSpacing.borderRadiusLg,
    boxShadow: [
      BoxShadow(
        color: Color(0x283B82F6), // subtle colored drop shadow
        blurRadius: 16,
        offset: Offset(0, 6),
      ),
    ],
  );

  /// Circular or rounded icon container decoration for role cards and list items.
  static BoxDecoration iconContainer({required Color backgroundColor}) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: AppSpacing.borderRadiusMd,
    );
  }

  /// Pill badge container decoration (for DELIVERED, IN TRANSIT, PENDING).
  static BoxDecoration badgeContainer({required Color backgroundColor}) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: AppSpacing.borderRadiusSm,
    );
  }
}
