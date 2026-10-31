import 'auth_service.dart';
import '../models/auth_user.dart';
import 'firebase_auth_service.dart';
import 'firebase_initializer.dart';

/// Service locator and dependency provider for [AuthService].
///
/// Allows dependency injection for tests and previews while providing
/// a default [FirebaseAuthService] in production.
class AuthServiceProvider {
  AuthServiceProvider._();

  static AuthService? _customInstance;

  /// Returns the current active [AuthService] instance.
  static AuthService get instance {
    final customInstance = _customInstance;
    if (customInstance != null) return customInstance;

    if (!FirebaseInitializer.isInitialized) {
      throw AuthException(
        'Firebase is not configured for this app. Verify the Firebase '
        'configuration and Android package ID, then try again.',
        code:
            FirebaseInitializer.initializationErrorCode ??
            'firebase-not-initialized',
      );
    }

    return FirebaseAuthService();
  }

  /// Sets a custom [AuthService] (primarily used in widget & unit tests).
  static void setMockInstance(AuthService? service) {
    _customInstance = service;
  }

  /// Resets the provider back to the default implementation.
  static void reset() {
    _customInstance = null;
  }
}
