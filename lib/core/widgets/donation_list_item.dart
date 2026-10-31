import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../models/donation_record.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../theme/app_card_styles.dart';
import 'status_badge.dart';

/// Reusable donation list item card matching the Figma design:
/// - Leading capsule/medicine icon tilted 45 degrees inside rounded container
/// - Medicine name and unit count column
/// - Trailing status badge (DELIVERED, IN TRANSIT, PENDING)
class DonationListItem extends StatelessWidget {
  const DonationListItem({super.key, required this.record, this.onTap});

  final DonationRecord record;
  final VoidCallback? onTap;

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
            padding: AppSpacing.cardPadding,
            child: Row(
              children: [
                // Capsule icon container with 45-degree tilted capsule
                Container(
                  width: AppSpacing.medicineIconBoxSize,
                  height: AppSpacing.medicineIconBoxSize,
                  decoration: BoxDecoration(
                    color: AppColors.medicineIconBg,
                    borderRadius: AppSpacing.borderRadiusMd,
                  ),
                  child: Center(
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: const Icon(
                        Icons.medication_outlined,
                        color: AppColors.medicineIcon,
                        size: AppSpacing.iconSize + 2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: AppSpacing.lg),

                // Medicine title & unit count
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(record.medicineName, style: AppTextStyles.cardTitle),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        '${record.unitCount} ${AppStrings.unitsSuffix}',
                        style: AppTextStyles.listSubtitle,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: AppSpacing.md),

                // Status Badge
                StatusBadge(status: record.status),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
