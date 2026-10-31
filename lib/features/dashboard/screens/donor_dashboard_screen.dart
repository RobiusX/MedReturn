import 'package:flutter/material.dart';

import '../../../app/app_navigator.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/donation_list_item.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/stat_card.dart';
import '../../../models/donation_record.dart';

/// Screen 3 & 4: Donor Dashboard Screen
///
/// Reproduces the Figma design with pixel precision:
/// - Personalized header with greeting & profile avatar (tappable to Profile)
/// - Two side-by-side metric stat cards (Total Donated: 24, Active Donations: 3)
/// - Vibrant purple "+ Donate Medicine" action button (navigates to Donate)
/// - "Recent Donations" section with categorized status badges
/// - Full Android back navigation support to Role Selection
class DonorDashboardScreen extends StatelessWidget {
  const DonorDashboardScreen({
    super.key,
    this.userName = 'Robius',
    this.totalDonated = 24,
    this.activeDonations = 3,
    this.recentDonations = defaultDonations,
  });

  final String userName;
  final int totalDonated;
  final int activeDonations;
  final List<DonationRecord> recentDonations;

  static const List<DonationRecord> defaultDonations = [
    DonationRecord(
      id: '1',
      medicineName: 'Amoxicillin',
      unitCount: 50,
      status: DonationStatus.delivered,
    ),
    DonationRecord(
      id: '2',
      medicineName: 'Ibuprofen',
      unitCount: 30,
      status: DonationStatus.inTransit,
    ),
    DonationRecord(
      id: '3',
      medicineName: 'Metformin',
      unitCount: 100,
      status: DonationStatus.pending,
    ),
  ];

  void _onDonateMedicinePressed(BuildContext context) {
    AppNavigator.toDonateMedicine(context);
  }

  void _onProfilePressed(BuildContext context) {
    AppNavigator.toProfile(context);
  }

  void _onDonationItemTapped(BuildContext context, DonationRecord record) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Selected donation: ${record.medicineName}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.headerTop),

              // Header Row (Greeting & Avatar)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, $userName!',
                          style: AppTextStyles.greeting,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        const Text(
                          AppStrings.donorSubtitle,
                          style: AppTextStyles.greetingSubtitle,
                        ),
                      ],
                    ),
                  ),

                  // Profile Avatar Button (Figma image with fallback)
                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      key: const Key('profile_avatar_button'),
                      onTap: () => _onProfilePressed(context),
                      customBorder: const CircleBorder(),
                      child: Container(
                        width: AppSpacing.profileAvatarSize,
                        height: AppSpacing.profileAvatarSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryContainer,
                          border: Border.all(
                            color: AppColors.cardBorder,
                            width: 1.5,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/illustrations/avatar_robius.png',
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => const Center(
                              child: Icon(
                                Icons.person,
                                color: AppColors.primary,
                                size: AppSpacing.iconSize + 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.xxl),

              // Metrics Row (Total Donated & Active Donations)
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      label: AppStrings.totalDonatedLabel,
                      value: '$totalDonated',
                      valueStyle: AppTextStyles.statValueBlue,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: StatCard(
                      label: AppStrings.activeDonationsLabel,
                      value: '$activeDonations',
                      valueStyle: AppTextStyles.statValuePurple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.xxl),

              // "+ Donate Medicine" Action Button
              PrimaryButton(
                text: AppStrings.donateMedicineButton,
                icon: Icons.add,
                backgroundColor: AppColors.purple,
                borderRadius: AppSpacing.borderRadiusMd,
                onPressed: () => _onDonateMedicinePressed(context),
              ),

              const SizedBox(height: AppSpacing.xxl),

              // "Recent Donations" Section Heading
              const Text(
                AppStrings.recentDonationsSection,
                style: AppTextStyles.sectionTitle,
              ),

              const SizedBox(height: AppSpacing.md),

              // Recent Donations List or Empty State
              if (recentDonations.isEmpty)
                Container(
                  padding: AppSpacing.cardPadding,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: AppSpacing.borderRadiusLg,
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: const Text(
                    'No donations yet. Tap "+ Donate Medicine" to start!',
                    style: AppTextStyles.cardDescription,
                    textAlign: TextAlign.center,
                  ),
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recentDonations.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.md),
                  itemBuilder: (context, index) {
                    final record = recentDonations[index];
                    return DonationListItem(
                      record: record,
                      onTap: () => _onDonationItemTapped(context, record),
                    );
                  },
                ),

              const SizedBox(height: AppSpacing.xxxl),
            ],
          ),
        ),
      ),
    );
  }
}
