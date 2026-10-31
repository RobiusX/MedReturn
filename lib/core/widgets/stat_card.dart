import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import '../constants/app_text_styles.dart';
import '../theme/app_card_styles.dart';

/// Reusable metric card displaying a label and large stat value.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.valueStyle,
  });

  final String label;
  final String value;
  final TextStyle valueStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.statCardPadding,
      decoration: AppCardStyles.statCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: AppTextStyles.statLabel),
          const SizedBox(height: AppSpacing.sm),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
