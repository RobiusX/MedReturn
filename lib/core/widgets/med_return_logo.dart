import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';

/// The MedReturn brand logo widget matching the Figma design:
/// - Gradient pill with "MedReturn" in bold white text
/// - Below the pill: "Safe medicine. Better access." tagline
class MedReturnLogo extends StatelessWidget {
  const MedReturnLogo({super.key, this.showTagline = true});

  final bool showTagline;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xxxl,
            vertical: AppSpacing.md + 2,
          ),
          decoration: BoxDecoration(
            gradient: AppColors.logoGradient,
            borderRadius: AppSpacing.borderRadiusLg,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.25),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Text(AppStrings.appName, style: AppTextStyles.logoTitle),
        ),
        if (showTagline) ...[
          const SizedBox(height: AppSpacing.md),
          const Text(
            AppStrings.appTagline,
            style: AppTextStyles.tagline,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
