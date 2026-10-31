import 'package:flutter/material.dart';

import '../../../app/app_navigator.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/role_card.dart';

/// Screen 2: Role Selection Screen
///
/// Reproduces the Figma design with pixel precision:
/// - "Choose your role" bold heading with subtitle
/// - 3 prominent role cards: Donor, Clinic, Pharmacist
/// - Smooth tap interactions with colored circle icons and chevrons
/// - Full Android back navigation support to Login
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  void _onRoleSelected(BuildContext context, String roleTitle) {
    if (roleTitle == AppStrings.roleDonorTitle) {
      AppNavigator.toDonorDashboard(context);
    } else if (roleTitle == AppStrings.roleClinicTitle) {
      AppNavigator.toClinicDashboard(context);
    } else if (roleTitle == AppStrings.rolePharmacistTitle) {
      AppNavigator.toPharmacistDashboard(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPaddingWithTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              const Text(
                AppStrings.chooseYourRole,
                style: AppTextStyles.screenHeading,
              ),

              const SizedBox(height: AppSpacing.sm),

              const Text(
                AppStrings.roleSelectionSubtitle,
                style: AppTextStyles.screenSubtitle,
              ),

              const SizedBox(height: AppSpacing.xxxl),

              // Role 1: Donor
              RoleCard(
                title: AppStrings.roleDonorTitle,
                description: AppStrings.roleDonorDescription,
                icon: Icons.favorite_border,
                iconColor: AppColors.roleDonorIcon,
                iconBgColor: AppColors.roleDonorBg,
                onTap: () =>
                    _onRoleSelected(context, AppStrings.roleDonorTitle),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Role 2: Clinic
              RoleCard(
                title: AppStrings.roleClinicTitle,
                description: AppStrings.roleClinicDescription,
                icon: Icons.local_hospital_outlined,
                iconColor: AppColors.roleClinicIcon,
                iconBgColor: AppColors.roleClinicBg,
                onTap: () =>
                    _onRoleSelected(context, AppStrings.roleClinicTitle),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Role 3: Pharmacist
              RoleCard(
                title: AppStrings.rolePharmacistTitle,
                description: AppStrings.rolePharmacistDescription,
                icon: Icons.shield_outlined,
                iconColor: AppColors.rolePharmacistIcon,
                iconBgColor: AppColors.rolePharmacistBg,
                onTap: () =>
                    _onRoleSelected(context, AppStrings.rolePharmacistTitle),
              ),

              const SizedBox(height: AppSpacing.xxxl),
            ],
          ),
        ),
      ),
    );
  }
}
