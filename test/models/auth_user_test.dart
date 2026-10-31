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

    test('AuthException maps common Firebase error codes into user-friendly messages', () {
      final invalidCred = AuthException(
        'Invalid email or password. Please verify your credentials.',
        code: 'invalid-credential',
      );
      expect(invalidCred.message, contains('Invalid email or password'));

      final alreadyInUse = AuthException(
        'An account already exists with this email address.',
        code: 'email-already-in-use',
      );
      expect(alreadyInUse.message, contains('already exists'));

      final weakPass = AuthException(
        'Password is too weak. Please choose a stronger password.',
        code: 'weak-password',
      );
      expect(weakPass.message, contains('too weak'));
    });
  });
}
