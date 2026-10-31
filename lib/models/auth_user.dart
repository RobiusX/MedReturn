import 'package:firebase_auth/firebase_auth.dart' as fb;

/// Represents an authenticated user in MedReturn.
///
/// Decouples UI and business logic from the underlying Firebase Auth User object.
class AuthUser {
  const AuthUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.isEmailVerified = false,
  });

  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final bool isEmailVerified;

  /// Creates an [AuthUser] from a Firebase [fb.User].
  factory AuthUser.fromFirebaseUser(fb.User user) {
    return AuthUser(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
      isEmailVerified: user.emailVerified,
    );
  }

  /// Creates an [AuthUser] from a Map.
  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      uid: map['uid'] as String? ?? '',
      email: map['email'] as String? ?? '',
      displayName: map['displayName'] as String?,
      photoUrl: map['photoUrl'] as String?,
      isEmailVerified: map['isEmailVerified'] as bool? ?? false,
    );
  }

  /// Converts this [AuthUser] to a serializable Map.
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'isEmailVerified': isEmailVerified,
    };
  }

  AuthUser copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? photoUrl,
    bool? isEmailVerified,
  }) {
    return AuthUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUser &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          email == other.email;

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;

  @override
  String toString() =>
      'AuthUser(uid: $uid, email: $email, displayName: $displayName)';
}

/// Custom exception class for authentication operations in MedReturn.
///
/// Maps technical Firebase error codes into human-friendly, secure messages.
class AuthException implements Exception {
  const AuthException(this.message, {this.code});

  final String message;
  final String? code;

  /// Creates an [AuthException] from a [fb.FirebaseAuthException].
  factory AuthException.fromFirebaseException(fb.FirebaseAuthException e) {
    return AuthException(
      _mapFirebaseErrorCode(e.code, e.message),
      code: e.code,
    );
  }

  static String _mapFirebaseErrorCode(String code, String? fallbackMessage) {
    switch (code) {
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'Invalid email or password. Please verify your credentials.';
      case 'email-already-in-use':
        return 'An account already exists with this email address.';
      case 'invalid-email':
        return 'The email address is improperly formatted.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This account has been disabled. Please contact support.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again in a few minutes.';
      case 'network-request-failed':
        return 'Network connection failed. Please check your internet connection.';
      case 'operation-not-allowed':
        return 'Email/password sign-in is disabled for this Firebase project. '
            'Enable it in Firebase Console.';
      case 'app-not-authorized':
      case 'invalid-api-key':
      case 'configuration-not-found':
        return 'Firebase is not configured correctly for this app. '
            'Check the Firebase project and Android package ID.';
      default:
        return fallbackMessage ??
            'An authentication error occurred. Please try again.';
    }
  }

  @override
  String toString() => message;
}
