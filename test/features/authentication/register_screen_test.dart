import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/app/routes.dart';
import 'package:medreturn/core/theme/app_theme.dart';
import 'package:medreturn/features/authentication/screens/register_screen.dart';

import '../../mocks/mock_auth_service.dart';

void main() {
  late MockAuthService mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
  });

  tearDown(() {
    mockAuthService.dispose();
  });

  Widget createTestWidget() {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: RegisterScreen(authService: mockAuthService),
      routes: {
        AppRoutes.roleSelection: (_) => const Scaffold(body: Text('RoleSelectionScreen')),
      },
    );
  }

  group('RegisterScreen Widget Tests', () {
    testWidgets('renders all registration elements properly', (tester) async {
      await tester.pumpWidget(createTestWidget());

      expect(
        find.text('Create Account'),
        findsNWidgets(2),
      ); // AppBar title + button text
      expect(find.text('Join MedReturn'), findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
      expect(find.text('Already have an account? '), findsOneWidget);
    });

    testWidgets('shows validation errors when fields are left blank', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Tap Create Account without typing anything
      await tester.tap(find.widgetWithText(ElevatedButton, 'Create Account'));
      await tester.pumpAndSettle();

      expect(find.text('Full name cannot be empty'), findsOneWidget);
      expect(find.text('Please enter your email address'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('shows error when confirm password does not match', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), 'Robius Sani');
      await tester.enterText(textFields.at(1), 'robius@university.edu');
      await tester.enterText(textFields.at(2), 'password123');
      await tester.enterText(textFields.at(3), 'mismatch456');
      await tester.pump();

      await tester.tap(find.widgetWithText(ElevatedButton, 'Create Account'));
      await tester.pumpAndSettle();

      expect(find.text('Passwords do not match'), findsOneWidget);
    });

    testWidgets('successfully registers new user with valid input', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), 'Robius Sani');
      await tester.enterText(textFields.at(1), 'robius@university.edu');
      await tester.enterText(textFields.at(2), 'password123');
      await tester.enterText(textFields.at(3), 'password123');
      await tester.pump();

      await tester.tap(find.widgetWithText(ElevatedButton, 'Create Account'));
      await tester.pumpAndSettle();

      expect(mockAuthService.currentUser?.email, 'robius@university.edu');
      expect(mockAuthService.currentUser?.displayName, 'Robius Sani');
    });

    testWidgets('displays error SnackBar when registration fails', (
      tester,
    ) async {
      // Pre-register user with this email
      await mockAuthService.registerWithEmailAndPassword(
        email: 'existing@university.edu',
        password: 'password123',
      );

      await tester.pumpWidget(createTestWidget());

      final textFields = find.byType(TextFormField);
      await tester.enterText(textFields.at(0), 'Robius Sani');
      await tester.enterText(textFields.at(1), 'existing@university.edu');
      await tester.enterText(textFields.at(2), 'password123');
      await tester.enterText(textFields.at(3), 'password123');
      await tester.pump();

      await tester.tap(find.widgetWithText(ElevatedButton, 'Create Account'));
      await tester.pumpAndSettle();

      expect(
        find.text('An account already exists with this email address.'),
        findsOneWidget,
      );
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });
  });
}
