import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';

/// A reusable elevated action button matching the MedReturn Figma design.
///
/// Features:
/// - Rounded rectangle corners (12dp radius default, matching Figma Login & Donate buttons)
/// - Solid background color (Electric Blue or Purple)
/// - Height: 48dp
/// - Optional leading icon
/// - Loading state
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.icon,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius ?? AppSpacing.borderRadiusMd;
    final effectiveBgColor = backgroundColor ?? AppColors.primary;

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: effectiveBgColor,
        foregroundColor: AppColors.textWhite,
        disabledBackgroundColor: effectiveBgColor.withValues(alpha: 0.5),
        disabledForegroundColor: AppColors.textWhite.withValues(alpha: 0.7),
        elevation: 0,
        minimumSize: const Size(double.infinity, AppSpacing.buttonHeight),
        shape: RoundedRectangleBorder(borderRadius: effectiveRadius),
        textStyle: AppTextStyles.button,
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.textWhite),
              ),
            )
          : icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: AppSpacing.iconSize,
                  color: AppColors.textWhite,
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(text, style: AppTextStyles.button),
              ],
            )
          : Text(text, style: AppTextStyles.button),
    );
  }
}
