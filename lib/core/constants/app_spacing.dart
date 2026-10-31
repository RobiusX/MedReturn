import 'package:flutter/material.dart';

/// Centralized spacing, padding, margin, and border radius constants
/// matching the MedReturn Figma design.
class AppSpacing {
  AppSpacing._();

  // ---------------------------------------------------------------------------
  // Linear Spacing Increments
  // ---------------------------------------------------------------------------
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0; // Standard screen horizontal padding
  static const double xxxl = 32.0;
  static const double huge = 40.0;
  static const double headerTop = 40.0;
  static const double screenTop = 48.0;

  // ---------------------------------------------------------------------------
  // Screen Edge Padding
  // ---------------------------------------------------------------------------
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: xxl);
  static const EdgeInsets screenPaddingWithTop = EdgeInsets.only(
    left: xxl,
    right: xxl,
    top: screenTop,
    bottom: xxl,
  );

  // ---------------------------------------------------------------------------
  // Card Padding
  // ---------------------------------------------------------------------------
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets roleCardPadding = EdgeInsets.symmetric(
    horizontal: lg + 2,
    vertical: lg + 2,
  );
  static const EdgeInsets statCardPadding = EdgeInsets.all(lg);
  static const EdgeInsets inputContentPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md + 2,
  );

  // ---------------------------------------------------------------------------
  // Status Badge Padding
  // ---------------------------------------------------------------------------
  static const EdgeInsets badgePadding = EdgeInsets.symmetric(
    horizontal: 10.0,
    vertical: 4.0,
  );

  // ---------------------------------------------------------------------------
  // Border Radii
  // ---------------------------------------------------------------------------
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0; // Input fields, buttons, stat cards
  static const double radiusLg = 16.0; // Role cards, list cards, logo pill
  static const double radiusPill = 999.0;

  static const BorderRadius borderRadiusSm = BorderRadius.all(
    Radius.circular(radiusSm),
  );
  static const BorderRadius borderRadiusMd = BorderRadius.all(
    Radius.circular(radiusMd),
  );
  static const BorderRadius borderRadiusLg = BorderRadius.all(
    Radius.circular(radiusLg),
  );
  static const BorderRadius borderRadiusPill = BorderRadius.all(
    Radius.circular(radiusPill),
  );

  // ---------------------------------------------------------------------------
  // Component Sizes
  // ---------------------------------------------------------------------------
  static const double buttonHeight = 48.0;
  static const double inputHeight = 48.0;
  static const double roleIconBoxSize = 46.0;
  static const double medicineIconBoxSize = 40.0;
  static const double profileAvatarSize = 42.0;
  static const double iconSize = 20.0;
}
