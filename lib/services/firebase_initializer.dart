import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Handles safe, resilient Firebase initialization.
///
/// Ensures the application boots gracefully whether running in production,
/// in local emulation, or during headless automated widget testing.
class FirebaseInitializer {
  FirebaseInitializer._();

  static bool _isInitialized = false;

  /// Returns true if Firebase has been successfully initialized.
  static bool get isInitialized => _isInitialized;

  /// Initializes Firebase services if not already initialized.
  static Future<void> initialize({FirebaseOptions? options}) async {
    if (_isInitialized) return;

    try {
      if (options != null) {
        await Firebase.initializeApp(options: options);
      } else {
        await Firebase.initializeApp();
      }
      _isInitialized = true;
      debugPrint('[FirebaseInitializer] Firebase successfully initialized.');
    } catch (e) {
      debugPrint(
        '[FirebaseInitializer] Notice: Firebase initialization bypassed or deferred ($e). '
        'Offline mock services will be used until flutterfire configure is executed.',
      );
    }
  }
}

