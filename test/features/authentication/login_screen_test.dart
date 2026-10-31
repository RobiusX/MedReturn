import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/app/routes.dart';
import 'package:medreturn/core/constants/app_strings.dart';
import 'package:medreturn/core/theme/app_theme.dart';
import 'package:medreturn/features/authentication/screens/login_screen.dart';
import 'package:medreturn/models/auth_user.dart';

import '../../mocks/mock_auth_service.dart';

void main() {
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService(
      initialUser: const AuthUser(
        uid: 'user_1',
        email: 'student@university.edu',
        displayName: 'Test Student',
      ),
    );
  });

  tearDown(() {
    mockAuthService.dispose();
  });

  Widget createTestWidget({MockAuthService? authService}) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: LoginScreen(authService: authService ?? mockAuthService),
      routes: {
        AppRoutes.roleSelection: (_) => const Scaffold(body: Text('RoleSelectionScreen')),
      },
    );
  }

  group('LoginScreen Widget Tests', () {
    testWidgets('renders all Figma login elements correctly', (tester) async {
      await tester.pumpWidget(createTestWidget());

      // Brand Logo & Tagline
      expect(find.text(AppStrings.appName), findsOneWidget);
      expect(find.text(AppStrings.appTagline), findsOneWidget);

      // Input labels
      expect(find.text(AppStrings.emailAddressLabel), findsOneWidget);
      expect(find.text(AppStrings.passwordLabel), findsOneWidget);

      // Placeholder hints
      expect(find.text(AppStrings.emailHint), findsOneWidget);
      expect(find.text(AppStrings.passwordHint), findsOneWidget);

      // Icons
      expect(find.byIcon(Icons.mail_outline), findsOneWidget);
      expect(find.byIcon(Icons.lock_outline), findsOneWidget);

      // Login Button
      expect(find.text(AppStrings.loginButton), findsOneWidget);

      // Register link
      expect(find.text('${AppStrings.newToMedReturn} '), findsOneWidget);
      expect(find.text(AppStrings.register), findsOneWidget);
    });

    testWidgets('shows validation errors when fields are empty', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Tap login without entering credentials
      await tester.tap(find.text(AppStrings.loginButton));
      await tester.pumpAndSettle();

      expect(find.text('Please enter your email address'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('shows validation error on invalid email format', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final emailField = find.byType(TextFormField).first;
      await tester.enterText(emailField, 'not-an-email');
      await tester.tap(find.text(AppStrings.loginButton));
      await tester.pumpAndSettle();

      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets(
      'allows user to enter valid credentials and toggles password visibility',
      (tester) async {
        await tester.pumpWidget(createTestWidget());

        final emailFields = find.byType(TextFormField);
        await tester.enterText(emailFields.at(0), 'student@university.edu');
        await tester.enterText(emailFields.at(1), 'password123');
        await tester.pump();

        expect(find.text('student@university.edu'), findsOneWidget);

        // Toggle password visibility
        expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
        await tester.tap(find.byIcon(Icons.visibility_off_outlined));
        await tester.pump();
        expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);
      },
    );

    testWidgets('shows error SnackBar when credentials are invalid', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final emailFields = find.byType(TextFormField);
      await tester.enterText(emailFields.at(0), 'student@university.edu');
      await tester.enterText(emailFields.at(1), 'wrongpass');
      await tester.pump();

      await tester.tap(find.text(AppStrings.loginButton));
      await tester.pumpAndSettle();

      expect(
        find.text('Invalid email or password. Please verify your credentials.'),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('shows loading indicator during authentication', (
      tester,
    ) async {
      mockAuthService.simulatedDelay = const Duration(milliseconds: 300);

      await tester.pumpWidget(createTestWidget());

      final emailFields = find.byType(TextFormField);
      await tester.enterText(emailFields.at(0), 'student@university.edu');
      await tester.enterText(emailFields.at(1), 'password123');
      await tester.pump();

      await tester.tap(find.text(AppStrings.loginButton));
      // Pump initial frame to trigger setState(_isLoading = true)
      await tester.pump(const Duration(milliseconds: 50));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Settle timer
      await tester.pumpAndSettle();
    });
  });
}
