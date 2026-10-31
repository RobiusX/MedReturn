import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/core/constants/app_strings.dart';
import 'package:medreturn/core/theme/app_theme.dart';
import 'package:medreturn/core/widgets/donation_list_item.dart';
import 'package:medreturn/core/widgets/stat_card.dart';
import 'package:medreturn/core/widgets/status_badge.dart';
import 'package:medreturn/features/dashboard/screens/donor_dashboard_screen.dart';

void main() {
  Widget createTestWidget() {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const DonorDashboardScreen(),
    );
  }

  group('DonorDashboardScreen Widget Tests', () {
    testWidgets('renders all Figma dashboard elements accurately', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Header greetings
      expect(find.text(AppStrings.donorGreeting), findsOneWidget);
      expect(find.text(AppStrings.donorSubtitle), findsOneWidget);

      // Stat cards
      expect(find.byType(StatCard), findsNWidgets(2));
      expect(find.text(AppStrings.totalDonatedLabel), findsOneWidget);
      expect(find.text('24'), findsOneWidget);
      expect(find.text(AppStrings.activeDonationsLabel), findsOneWidget);
      expect(find.text('3'), findsOneWidget);

      // Donate Medicine Button
      expect(find.text(AppStrings.donateMedicineButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Recent Donations Section
      expect(find.text(AppStrings.recentDonationsSection), findsOneWidget);

      // 3 Donation items
      expect(find.byType(DonationListItem), findsNWidgets(3));
      expect(find.text('Amoxicillin'), findsOneWidget);
      expect(find.text('50 units'), findsOneWidget);
      expect(find.text('Ibuprofen'), findsOneWidget);
      expect(find.text('30 units'), findsOneWidget);
      expect(find.text('Metformin'), findsOneWidget);
      expect(find.text('100 units'), findsOneWidget);

      // 3 Status badges
      expect(find.byType(StatusBadge), findsNWidgets(3));
      expect(find.text(AppStrings.statusDelivered), findsOneWidget);
      expect(find.text(AppStrings.statusInTransit), findsOneWidget);
      expect(find.text(AppStrings.statusPending), findsOneWidget);
    });
  });
}
