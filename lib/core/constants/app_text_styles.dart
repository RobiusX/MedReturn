import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Centralized typography and text styles for the MedReturn application.
///
/// Accurately aligned with the font scales, weights, and letter-spacings
/// from the MedReturn Figma designs.
class AppTextStyles {
  AppTextStyles._();

  // ---------------------------------------------------------------------------
  // Brand & Splash Typography
  // ---------------------------------------------------------------------------
  static const TextStyle logoTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    color: AppColors.textWhite,
  );

  static const TextStyle tagline = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.textMuted,
  );

  // ---------------------------------------------------------------------------
  // Headings & Screen Titles
  // ---------------------------------------------------------------------------
  static const TextStyle screenHeading = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static const TextStyle screenSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: AppColors.textMuted,
    height: 1.4,
  );

  static const TextStyle greeting = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static const TextStyle greetingSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: AppColors.textMuted,
    height: 1.4,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.1,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // ---------------------------------------------------------------------------
  // Card & List Typography
  // ---------------------------------------------------------------------------
  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle cardDescription = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: AppColors.textMuted,
    height: 1.35,
  );

  static const TextStyle listSubtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: AppColors.textMuted,
  );

  // ---------------------------------------------------------------------------
  // Metrics & Stats
  // ---------------------------------------------------------------------------
  static const TextStyle statLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: AppColors.textMuted,
  );

  static const TextStyle statValueBlue = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.statTotalDonated,
    height: 1.2,
  );

  static const TextStyle statValuePurple = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.statActiveDonations,
    height: 1.2,
  );

  // ---------------------------------------------------------------------------
  // Form Fields & Controls
  // ---------------------------------------------------------------------------
  static const TextStyle inputLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: AppColors.textPrimary,
  );

  static const TextStyle inputHint = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.1,
    color: AppColors.textPlaceholder,
  );

  // ---------------------------------------------------------------------------
  // Buttons & Badges
  // ---------------------------------------------------------------------------
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.textWhite,
  );

  static const TextStyle badgeDelivered = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.badgeDeliveredText,
  );

  static const TextStyle badgeInTransit = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.badgeInTransitText,
  );

  static const TextStyle badgePending = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.badgePendingText,
  );

  // ---------------------------------------------------------------------------
  // Links & Captions
  // ---------------------------------------------------------------------------
  static const TextStyle caption = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static const TextStyle link = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.link,
    decoration: TextDecoration.underline,
  );
}
