import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../models/auth_user.dart';
import 'auth_service.dart';

/// Firebase Authentication implementation of [AuthService].
///
/// Handles low-level Firebase Auth calls, error conversion to [AuthException],
/// and exposes normalized [AuthUser] objects.
class FirebaseAuthService implements AuthService {
  FirebaseAuthService({fb.FirebaseAuth? auth})
    : _auth = auth ?? fb.FirebaseAuth.instance;

  final fb.FirebaseAuth _auth;

  @override
  Stream<AuthUser?> get authStateChanges {
    return _auth.authStateChanges().map((user) {
      if (user == null) return null;
      return AuthUser.fromFirebaseUser(user);
    });
  }

  @override
  AuthUser? get currentUser {
    final user = _auth.currentUser;
    if (user == null) return null;
    return AuthUser.fromFirebaseUser(user);
  }

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthException(
          'Authentication failed: user record not found.',
        );
      }
      return AuthUser.fromFirebaseUser(user);
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException(e.toString());
    }
  }

  @override
  Future<AuthUser> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthException(
          'Registration failed: user record not created.',
        );
      }

      if (displayName != null && displayName.trim().isNotEmpty) {
        await user.updateDisplayName(displayName.trim());
        await user.reload();
        final refreshedUser = _auth.currentUser;
        if (refreshedUser != null) {
          return AuthUser.fromFirebaseUser(refreshedUser);
        }
      }

      return AuthUser.fromFirebaseUser(user);
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      if (e is AuthException) rethrow;
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> reloadUser() async {
    try {
      await _auth.currentUser?.reload();
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException.fromFirebaseException(e);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }
}
