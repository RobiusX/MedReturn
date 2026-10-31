import 'package:flutter/material.dart';

import '../../models/donation_record.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../theme/app_card_styles.dart';

/// Reusable pill status badge for DELIVERED, IN TRANSIT, and PENDING.
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status});

  final DonationStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, textColor, bgColor, textStyle) = switch (status) {
      DonationStatus.delivered => (
        AppStrings.statusDelivered,
        AppColors.badgeDeliveredText,
        AppColors.badgeDeliveredBg,
        AppTextStyles.badgeDelivered,
      ),
      DonationStatus.inTransit => (
        AppStrings.statusInTransit,
        AppColors.badgeInTransitText,
        AppColors.badgeInTransitBg,
        AppTextStyles.badgeInTransit,
      ),
      DonationStatus.pending => (
        AppStrings.statusPending,
        AppColors.badgePendingText,
        AppColors.badgePendingBg,
        AppTextStyles.badgePending,
      ),
    };

    return Container(
      padding: AppSpacing.badgePadding,
      decoration: AppCardStyles.badgeContainer(backgroundColor: bgColor),
      child: Text(label, style: textStyle.copyWith(color: textColor)),
    );
  }
}
