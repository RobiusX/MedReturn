import 'auth_service.dart';
import 'firebase_auth_service.dart';

/// Service locator and dependency provider for [AuthService].
///
/// Allows dependency injection for tests and previews while providing
/// a default [FirebaseAuthService] in production.
class AuthServiceProvider {
  AuthServiceProvider._();

  static AuthService? _customInstance;

  /// Returns the current active [AuthService] instance.
  static AuthService get instance {
    return _customInstance ?? FirebaseAuthService();
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

