import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/app/app.dart';
import 'package:medreturn/app/app_navigator.dart';
import 'package:medreturn/core/constants/app_strings.dart';
import 'package:medreturn/core/widgets/unknown_route_screen.dart';
import 'package:medreturn/features/authentication/screens/login_screen.dart';
import 'package:medreturn/features/authentication/screens/register_screen.dart';
import 'package:medreturn/features/authentication/screens/role_selection_screen.dart';
import 'package:medreturn/features/dashboard/screens/clinic_dashboard_screen.dart';
import 'package:medreturn/features/dashboard/screens/donor_dashboard_screen.dart';
import 'package:medreturn/features/dashboard/screens/pharmacist_dashboard_screen.dart';
import 'package:medreturn/features/dashboard/screens/profile_screen.dart';
import 'package:medreturn/features/donation/screens/donate_medicine_screen.dart';
import 'package:medreturn/models/auth_user.dart';
import 'package:medreturn/services/auth_service_provider.dart';

import '../mocks/mock_auth_service.dart';

void main() {
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService(
      initialUser: const AuthUser(
        uid: 'user_1',
        email: 'user@university.edu',
        displayName: 'Test User',
      ),
    );
    AuthServiceProvider.setMockInstance(mockAuthService);
  });

  tearDown(() {
    AuthServiceProvider.reset();
    mockAuthService.dispose();
  });

  Future<void> submitValidLogin(WidgetTester tester) async {
    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'user@university.edu');
    await tester.enterText(fields.at(1), 'password123');
    await tester.tap(find.text(AppStrings.loginButton));
    await tester.pumpAndSettle();
  }

  group('MedReturn Full Navigation Test Suite', () {
    testWidgets('1. Initial launch displays LoginScreen', (tester) async {
      await tester.pumpWidget(const MedReturnApp());
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
      expect(find.text(AppStrings.appName), findsOneWidget);
    });

    testWidgets(
      '2. Login button navigates to RoleSelectionScreen on valid form',
      (tester) async {
        await tester.pumpWidget(const MedReturnApp());
        await tester.pumpAndSettle();

        await submitValidLogin(tester);

        expect(find.byType(RoleSelectionScreen), findsOneWidget);
        expect(find.text(AppStrings.chooseYourRole), findsOneWidget);
      },
    );

    testWidgets(
      '3. Android back navigation returns from RoleSelection to Login',
      (tester) async {
        await tester.pumpWidget(const MedReturnApp());
        await tester.pumpAndSettle();

        // Navigate to RoleSelection
        await submitValidLogin(tester);
        expect(find.byType(RoleSelectionScreen), findsOneWidget);

        // Trigger Android back
        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        await widgetsAppState.didPopRoute();
        await tester.pumpAndSettle();

        expect(find.byType(LoginScreen), findsOneWidget);
      },
    );

    testWidgets(
      '4. RoleSelection -> Donor card navigates to DonorDashboardScreen',
      (tester) async {
        await tester.pumpWidget(const MedReturnApp());
        await tester.pumpAndSettle();

        // Login -> RoleSelection
        await submitValidLogin(tester);

        // Tap Donor role card
        await tester.tap(find.text(AppStrings.roleDonorTitle));
        await tester.pumpAndSettle();

        expect(find.byType(DonorDashboardScreen), findsOneWidget);
        expect(find.text(AppStrings.donorGreeting), findsOneWidget);
      },
    );

    testWidgets(
      '5. RoleSelection -> Clinic card navigates to ClinicDashboardScreen',
      (tester) async {
        await tester.pumpWidget(const MedReturnApp());
        await tester.pumpAndSettle();

        // Login -> RoleSelection
        await submitValidLogin(tester);

        // Tap Clinic role card
        await tester.tap(find.text(AppStrings.roleClinicTitle));
        await tester.pumpAndSettle();

        expect(find.byType(ClinicDashboardScreen), findsOneWidget);

        // Back navigation to RoleSelection
        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        await widgetsAppState.didPopRoute();
        await tester.pumpAndSettle();

        expect(find.byType(RoleSelectionScreen), findsOneWidget);
      },
    );

    testWidgets(
      '6. RoleSelection -> Pharmacist card navigates to PharmacistDashboardScreen',
      (tester) async {
        await tester.pumpWidget(const MedReturnApp());
        await tester.pumpAndSettle();

        // Login -> RoleSelection
        await submitValidLogin(tester);

        // Tap Pharmacist role card
        await tester.tap(find.text(AppStrings.rolePharmacistTitle));
        await tester.pumpAndSettle();

        expect(find.byType(PharmacistDashboardScreen), findsOneWidget);

        // Back navigation to RoleSelection
        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        await widgetsAppState.didPopRoute();
        await tester.pumpAndSettle();

        expect(find.byType(RoleSelectionScreen), findsOneWidget);
      },
    );

    testWidgets(
      '7. DonorDashboard -> "+ Donate Medicine" navigates to DonateMedicineScreen',
      (tester) async {
        await tester.pumpWidget(const MedReturnApp());
        await tester.pumpAndSettle();

        // Go to DonorDashboard
        await submitValidLogin(tester);
        await tester.tap(find.text(AppStrings.roleDonorTitle));
        await tester.pumpAndSettle();

        // Tap Donate Medicine
        await tester.tap(find.text(AppStrings.donateMedicineButton));
        await tester.pumpAndSettle();

        expect(find.byType(DonateMedicineScreen), findsOneWidget);

        // Tap back button
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        expect(find.byType(DonorDashboardScreen), findsOneWidget);
      },
    );

    testWidgets(
      '8. DonorDashboard -> Profile avatar navigates to ProfileScreen',
      (tester) async {
        await tester.pumpWidget(const MedReturnApp());
        await tester.pumpAndSettle();

        // Go to DonorDashboard
        await submitValidLogin(tester);
        await tester.tap(find.text(AppStrings.roleDonorTitle));
        await tester.pumpAndSettle();

        // Tap Profile avatar
        await tester.tap(find.byKey(const Key('profile_avatar_button')));
        await tester.pumpAndSettle();

        expect(find.byType(ProfileScreen), findsOneWidget);

        // Tap back button
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        expect(find.byType(DonorDashboardScreen), findsOneWidget);
      },
    );

    testWidgets('9. LoginScreen -> Register link navigates to RegisterScreen', (
      tester,
    ) async {
      await tester.pumpWidget(const MedReturnApp());
      await tester.pumpAndSettle();

      // Tap Register link
      await tester.tap(find.text(AppStrings.register));
      await tester.pumpAndSettle();

      expect(find.byType(RegisterScreen), findsOneWidget);

      // Back to Login
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets(
      '10. Invalid/unknown routes render UnknownRouteScreen gracefully',
      (tester) async {
        await tester.pumpWidget(const MedReturnApp());
        await tester.pumpAndSettle();

        final context = tester.element(find.byType(LoginScreen));
        AppNavigator.pushNamed(context, '/invalid-route-xyz');
        await tester.pumpAndSettle();

        expect(find.byType(UnknownRouteScreen), findsOneWidget);
        expect(find.text('Route Not Found'), findsOneWidget);

        // Back to Login via button
        await tester.tap(find.text('Back to Login'));
        await tester.pumpAndSettle();

        expect(find.byType(LoginScreen), findsOneWidget);
      },
    );

    testWidgets('11. Prevents duplicate navigation on rapid double taps', (
      tester,
    ) async {
      await tester.pumpWidget(const MedReturnApp());
      await tester.pumpAndSettle();

      final context = tester.element(find.byType(LoginScreen));

      // Trigger two pushes concurrently
      AppNavigator.toRoleSelection(context);
      AppNavigator.toRoleSelection(context);
      await tester.pumpAndSettle();

      // Only one RoleSelectionScreen should be mounted on stack
      expect(find.byType(RoleSelectionScreen), findsOneWidget);

      // Popping once should return immediately to LoginScreen
      final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
      await widgetsAppState.didPopRoute();
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });
}
