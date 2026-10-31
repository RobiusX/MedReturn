import 'package:flutter/material.dart';

/// Centralized color palette for the MedReturn application.
///
/// Extracted directly from the Figma design specifications.
class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Brand & Primary Colors (Electric Blue & Vibrant Purple)
  // ---------------------------------------------------------------------------
  static const Color primary = Color(0xFF3B82F6);
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryContainer = Color(0xFFEBF2FE);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Purple accent (CTA / Clinic role / Active stats)
  static const Color purple = Color(0xFF8B5CF6);
  static const Color purpleLight = Color(0xFFA78BFA);
  static const Color purpleDark = Color(0xFF6D28D9);
  static const Color purpleContainer = Color(0xFFF3EEFE);

  // Brand Logo Gradient (Blue -> Purple pill)
  static const Color logoGradientStart = Color(0xFF437EF6);
  static const Color logoGradientEnd = Color(0xFF8360F6);

  static const LinearGradient logoGradient = LinearGradient(
    colors: [logoGradientStart, logoGradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // ---------------------------------------------------------------------------
  // Canvas & Surface Neutrals
  // ---------------------------------------------------------------------------
  static const Color background = Color(0xFFF9FAFB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF3F4F6);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFE5E7EB);

  // ---------------------------------------------------------------------------
  // Typography Colors
  // ---------------------------------------------------------------------------
  static const Color textPrimary = Color(0xFF111827); // Deep dark for headings
  static const Color textSecondary = Color(
    0xFF374151,
  ); // Medium-dark for field labels
  static const Color textMuted = Color(
    0xFF6B7280,
  ); // Gray for descriptions & subtitles
  static const Color textPlaceholder = Color(
    0xFF9CA3AF,
  ); // Light gray for hints
  static const Color textWhite = Color(0xFFFFFFFF); // White text

  // ---------------------------------------------------------------------------
  // Role Selection Card Accents
  // ---------------------------------------------------------------------------
  // Donor (Heart - Blue on soft blue)
  static const Color roleDonorIcon = Color(0xFF3B82F6);
  static const Color roleDonorBg = Color(0xFFEBF2FE);

  // Clinic (Building - Purple on soft purple)
  static const Color roleClinicIcon = Color(0xFF8B5CF6);
  static const Color roleClinicBg = Color(0xFFF3EEFE);

  // Pharmacist (Shield - Green on soft green)
  static const Color rolePharmacistIcon = Color(0xFF10B981);
  static const Color rolePharmacistBg = Color(0xFFE7F8F2);

  // Trailing chevron
  static const Color chevron = Color(0xFF9CA3AF);

  // ---------------------------------------------------------------------------
  // Dashboard Metrics & Badges
  // ---------------------------------------------------------------------------
  static const Color statTotalDonated = Color(0xFF3B82F6);
  static const Color statActiveDonations = Color(0xFF8B5CF6);

  // Status: DELIVERED (Green)
  static const Color badgeDeliveredText = Color(0xFF059669);
  static const Color badgeDeliveredBg = Color(0xFFECFDF5);

  // Status: IN TRANSIT (Amber / Orange)
  static const Color badgeInTransitText = Color(0xFFD97706);
  static const Color badgeInTransitBg = Color(0xFFFEF3C7);

  // Status: PENDING (Blue)
  static const Color badgePendingText = Color(0xFF3B82F6);
  static const Color badgePendingBg = Color(0xFFEFF6FF);

  // Recent donation pill icon
  static const Color medicineIcon = Color(0xFF3B82F6);
  static const Color medicineIconBg = Color(0xFFF0F4FA);

  // ---------------------------------------------------------------------------
  // Form Inputs & Controls
  // ---------------------------------------------------------------------------
  static const Color inputBg = Color(0xFFFFFFFF);
  static const Color inputBorder = Color(0xFFD1D5DB);
  static const Color inputBorderFocused = Color(0xFF3B82F6);
  static const Color inputIcon = Color(0xFF9CA3AF);
  static const Color link = Color(0xFF3B82F6);

  // ---------------------------------------------------------------------------
  // Feedback & State Colors
  // ---------------------------------------------------------------------------
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
}
