import '../models/auth_user.dart';

/// Abstract contract for authentication operations in MedReturn.
///
/// Decouples the presentation layer from the concrete authentication provider (Firebase Auth),
/// enabling unit testing, mocking, and provider swapping without UI modification.
abstract class AuthService {
  /// Stream that emits whenever the authentication state changes (login, logout, token refresh).
  Stream<AuthUser?> get authStateChanges;

  /// Returns the currently authenticated user, or null if unauthenticated.
  AuthUser? get currentUser;

  /// Authenticates an existing user using email and password.
  ///
  /// Throws [AuthException] on failure.
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Registers a new user using email and password.
  ///
  /// Throws [AuthException] on failure.
  Future<AuthUser> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  });

  /// Sends a password reset email to [email].
  ///
  /// Throws [AuthException] on failure.
  Future<void> sendPasswordResetEmail({required String email});

  /// Signs the currently authenticated user out.
  Future<void> signOut();

  /// Reloads the current user profile from the authentication provider.
  Future<void> reloadUser();
}

