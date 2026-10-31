import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';
import '../theme/app_card_styles.dart';

/// Reusable Role Selection card matching the Figma design:
/// - Rounded white card with subtle border and shadow
/// - Rounded square container (12dp radius) with role-specific icon
/// - Title and description text column
/// - Trailing chevron right icon
class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppCardStyles.standardCard,
      child: Material(
        color: Colors.transparent,
        borderRadius: AppSpacing.borderRadiusLg,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppSpacing.borderRadiusLg,
          child: Padding(
            padding: AppSpacing.roleCardPadding,
            child: Row(
              children: [
                // Rounded square icon container (matching Figma)
                Container(
                  width: AppSpacing.roleIconBoxSize,
                  height: AppSpacing.roleIconBoxSize,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: AppSpacing.borderRadiusMd,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: AppSpacing.iconSize + 4,
                    ),
                  ),
                ),

                const SizedBox(width: AppSpacing.lg),

                // Title and description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(title, style: AppTextStyles.cardTitle),
                      const SizedBox(height: AppSpacing.xs),
                      Text(description, style: AppTextStyles.cardDescription),
                    ],
                  ),
                ),

                const SizedBox(width: AppSpacing.sm),

                // Trailing chevron
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.chevron,
                  size: AppSpacing.iconSize + 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
