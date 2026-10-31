import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/models/auth_user.dart';

void main() {
  group('AuthUser and AuthException Model Tests', () {
    test('AuthUser serialization toMap and fromMap works accurately', () {
      const user = AuthUser(
        uid: 'user_123',
        email: 'test@medreturn.org',
        displayName: 'Test User',
        photoUrl: 'https://example.com/avatar.png',
        isEmailVerified: true,
      );

      final map = user.toMap();
      final restored = AuthUser.fromMap(map);

      expect(restored.uid, 'user_123');
      expect(restored.email, 'test@medreturn.org');
      expect(restored.displayName, 'Test User');
      expect(restored.photoUrl, 'https://example.com/avatar.png');
      expect(restored.isEmailVerified, isTrue);
      expect(restored, equals(user));
    });

    test('AuthUser copyWith updates fields correctly', () {
      const original = AuthUser(uid: '1', email: 'one@test.com');
      final updated = original.copyWith(
        displayName: 'Updated Name',
        isEmailVerified: true,
      );

      expect(updated.uid, '1');
      expect(updated.email, 'one@test.com');
      expect(updated.displayName, 'Updated Name');
      expect(updated.isEmailVerified, isTrue);
    });

    test('AuthException maps Firebase authentication errors for users', () {
      final cases = {
        'user-not-found': 'Invalid email or password',
        'wrong-password': 'Invalid email or password',
        'invalid-credential': 'Invalid email or password',
        'email-already-in-use': 'already exists',
        'weak-password': 'too weak',
        'invalid-email': 'improperly formatted',
        'network-request-failed': 'Network connection failed',
        'operation-not-allowed': 'Email/password sign-in is disabled',
        'too-many-requests': 'Too many failed attempts',
      };

      for (final entry in cases.entries) {
        final exception = AuthException.fromFirebaseException(
          FirebaseAuthException(code: entry.key, message: 'Firebase detail'),
        );

        expect(exception.code, entry.key);
        expect(exception.message, contains(entry.value));
        expect(exception.message, isNot(contains('Firebase detail')));
      }
    });
  });
}
