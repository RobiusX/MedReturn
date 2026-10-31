import 'dart:async';

import 'package:medreturn/models/auth_user.dart';
import 'package:medreturn/services/auth_service.dart';

/// An in-memory, testable implementation of [AuthService].
///
/// Simulates Firebase Auth operations in unit and widget tests without network access.
class MockAuthService implements AuthService {
  MockAuthService({AuthUser? initialUser}) {
    if (initialUser != null) {
      _currentUser = initialUser;
      _users[initialUser.email] = {
        'user': initialUser,
        'password': 'password123',
      };
    }
  }

  final _authStreamController = StreamController<AuthUser?>.broadcast();
  final Map<String, Map<String, dynamic>> _users = {};

  AuthUser? _currentUser;
  Exception? errorToThrow;
  Duration simulatedDelay = Duration.zero;

  @override
  Stream<AuthUser?> get authStateChanges => _authStreamController.stream;

  @override
  AuthUser? get currentUser => _currentUser;

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (simulatedDelay > Duration.zero) {
      await Future.delayed(simulatedDelay);
    }
    if (errorToThrow != null) {
      throw errorToThrow!;
    }

    final normalizedEmail = email.trim().toLowerCase();
    final record = _users[normalizedEmail];
    if (record == null) {
      throw const AuthException(
        'Invalid email or password. Please verify your credentials.',
        code: 'user-not-found',
      );
    }
    if (record['password'] != password) {
      throw const AuthException(
        'Invalid email or password. Please verify your credentials.',
        code: 'wrong-password',
      );
    }

    _currentUser = record['user'] as AuthUser;
    _authStreamController.add(_currentUser);
    return _currentUser!;
  }

  @override
  Future<AuthUser> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    if (simulatedDelay > Duration.zero) {
      await Future.delayed(simulatedDelay);
    }
    if (errorToThrow != null) {
      throw errorToThrow!;
    }

    final normalizedEmail = email.trim().toLowerCase();
    if (_users.containsKey(normalizedEmail)) {
      throw const AuthException(
        'An account already exists with this email address.',
        code: 'email-already-in-use',
      );
    }

    final newUser = AuthUser(
      uid: 'user_${DateTime.now().millisecondsSinceEpoch}',
      email: normalizedEmail,
      displayName: displayName,
      isEmailVerified: false,
    );

    _users[normalizedEmail] = {'user': newUser, 'password': password};

    _currentUser = newUser;
    _authStreamController.add(_currentUser);
    return newUser;
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    if (simulatedDelay > Duration.zero) {
      await Future.delayed(simulatedDelay);
    }
    if (errorToThrow != null) {
      throw errorToThrow!;
    }
  }

  @override
  Future<void> signOut() async {
    if (simulatedDelay > Duration.zero) {
      await Future.delayed(simulatedDelay);
    }
    _currentUser = null;
    _authStreamController.add(null);
  }

  @override
  Future<void> reloadUser() async {
    if (simulatedDelay > Duration.zero) {
      await Future.delayed(simulatedDelay);
    }
  }

  void dispose() {
    _authStreamController.close();
  }
}
