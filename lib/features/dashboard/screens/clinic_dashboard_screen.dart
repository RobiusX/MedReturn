import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';

/// Clinic Dashboard placeholder with working back navigation.
class ClinicDashboardScreen extends StatelessWidget {
  const ClinicDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(AppStrings.roleClinicTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.local_hospital_outlined,
                  size: 56,
                  color: AppColors.roleClinicIcon,
                ),
                const SizedBox(height: AppSpacing.lg),
                const Text(
                  'Clinic Portal',
                  style: AppTextStyles.screenHeading,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  AppStrings.roleClinicDescription,
                  style: AppTextStyles.screenSubtitle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
