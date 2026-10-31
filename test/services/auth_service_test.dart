import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/models/auth_user.dart';

import '../mocks/mock_auth_service.dart';

void main() {
  group('AuthService with MockAuthService Tests', () {
    late MockAuthService authService;

    setUp(() {
      authService = MockAuthService();
    });

    tearDown(() {
      authService.dispose();
    });

    test(
      'registerWithEmailAndPassword registers and logs in a new user',
      () async {
        expect(authService.currentUser, isNull);

        final user = await authService.registerWithEmailAndPassword(
          email: 'donor@medreturn.org',
          password: 'password123',
          displayName: 'Robius Sani',
        );

        expect(user.email, 'donor@medreturn.org');
        expect(user.displayName, 'Robius Sani');
        expect(authService.currentUser, equals(user));
      },
    );

    test(
      'registerWithEmailAndPassword throws error if email already exists',
      () async {
        await authService.registerWithEmailAndPassword(
          email: 'existing@medreturn.org',
          password: 'password123',
        );

        expect(
          () => authService.registerWithEmailAndPassword(
            email: 'existing@medreturn.org',
            password: 'differentPassword',
          ),
          throwsA(
            isA<AuthException>().having(
              (e) => e.code,
              'code',
              'email-already-in-use',
            ),
          ),
        );
      },
    );

    test('signInWithEmailAndPassword authenticates existing user with correct password', () async {
      await authService.registerWithEmailAndPassword(
        email: 'donor@medreturn.org',
        password: 'correctPassword',
      );
      await authService.signOut();
      expect(authService.currentUser, isNull);

      final loggedIn = await authService.signInWithEmailAndPassword(
        email: 'donor@medreturn.org',
        password: 'correctPassword',
      );

      expect(loggedIn.email, 'donor@medreturn.org');
      expect(authService.currentUser, equals(loggedIn));
    });

    test('signInWithEmailAndPassword throws error on wrong password', () async {
      await authService.registerWithEmailAndPassword(
        email: 'donor@medreturn.org',
        password: 'correctPassword',
      );

      expect(
        () => authService.signInWithEmailAndPassword(
          email: 'donor@medreturn.org',
          password: 'wrongPassword',
        ),
        throwsA(
          isA<AuthException>().having((e) => e.code, 'code', 'wrong-password'),
        ),
      );
    });

    test(
      'signOut clears current user and emits null on authStateChanges',
      () async {
        final user = await authService.registerWithEmailAndPassword(
          email: 'user@medreturn.org',
          password: 'password123',
        );
        expect(authService.currentUser, equals(user));

        final streamExpectation = expectLater(
          authService.authStateChanges,
          emits(isNull),
        );

        await authService.signOut();
        expect(authService.currentUser, isNull);
        await streamExpectation;
      },
    );
  });
}
