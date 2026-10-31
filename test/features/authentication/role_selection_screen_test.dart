import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/core/constants/app_strings.dart';
import 'package:medreturn/core/theme/app_theme.dart';
import 'package:medreturn/core/widgets/role_card.dart';
import 'package:medreturn/features/authentication/screens/role_selection_screen.dart';

void main() {
  Widget createTestWidget() {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const RoleSelectionScreen(),
    );
  }

  group('RoleSelectionScreen Widget Tests', () {
    testWidgets('renders all Figma role selection elements correctly', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Heading and Subtitle
      expect(find.text(AppStrings.chooseYourRole), findsOneWidget);
      expect(find.text(AppStrings.roleSelectionSubtitle), findsOneWidget);

      // 3 Role Cards
      expect(find.byType(RoleCard), findsNWidgets(3));

      // Donor card
      expect(find.text(AppStrings.roleDonorTitle), findsOneWidget);
      expect(find.text(AppStrings.roleDonorDescription), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);

      // Clinic card
      expect(find.text(AppStrings.roleClinicTitle), findsOneWidget);
      expect(find.text(AppStrings.roleClinicDescription), findsOneWidget);
      expect(find.byIcon(Icons.local_hospital_outlined), findsOneWidget);

      // Pharmacist card
      expect(find.text(AppStrings.rolePharmacistTitle), findsOneWidget);
      expect(find.text(AppStrings.rolePharmacistDescription), findsOneWidget);
      expect(find.byIcon(Icons.shield_outlined), findsOneWidget);

      // 3 Chevron icons
      expect(find.byIcon(Icons.chevron_right), findsNWidgets(3));
    });
  });
}
