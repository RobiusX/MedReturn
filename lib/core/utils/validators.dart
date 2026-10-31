/// Centralized input validation utilities for MedReturn.
///
/// Enforces data integrity and provides consistent, user-friendly error messages.
class Validators {
  Validators._();

  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  /// Validates an email address.
  ///
  /// Returns null if valid, or an error message string if invalid.
  static String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Please enter your email address';
    }
    if (!_emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates a password.
  ///
  /// Password must not be empty and must be at least [minLength] characters (default 6).
  static String? validatePassword(String? value, {int minLength = 6}) {
    final password = value ?? '';
    if (password.isEmpty) {
      return 'Please enter your password';
    }
    if (password.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  /// Validates password confirmation against the primary password.
  static String? validateConfirmPassword(
    String? confirmPassword,
    String? originalPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (confirmPassword != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  /// Validates a required text field (e.g. Full Name).
  static String? validateRequired(
    String? value, {
    String fieldName = 'This field',
    int minLength = 2,
  }) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return '$fieldName cannot be empty';
    }
    if (trimmed.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    return null;
  }
}
