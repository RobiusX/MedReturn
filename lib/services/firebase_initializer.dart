import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

/// Handles safe, resilient Firebase initialization.
///
/// Ensures the application boots gracefully whether running in production,
/// in local emulation, or during headless automated widget testing.
class FirebaseInitializer {
  FirebaseInitializer._();

  static bool _isInitialized = false;
  static String? _initializationErrorCode;

  /// Returns true if Firebase has been successfully initialized.
  static bool get isInitialized => _isInitialized;

  /// The last Firebase initialization error code, if initialization failed.
  static String? get initializationErrorCode => _initializationErrorCode;

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
      _initializationErrorCode = null;
      if (kDebugMode) {
        debugPrint('[FirebaseInitializer] Firebase initialized successfully.');
      }
    } on FirebaseException catch (error, stackTrace) {
      _initializationErrorCode = error.code;
      if (kDebugMode) {
        debugPrint(
          '[FirebaseInitializer] Initialization failed: '
          'plugin=${error.plugin}, code=${error.code}, message=${error.message}',
        );
        debugPrintStack(stackTrace: stackTrace);
      }
    } catch (error, stackTrace) {
      _initializationErrorCode = error.runtimeType.toString();
      if (kDebugMode) {
        debugPrint(
          '[FirebaseInitializer] Initialization failed: '
          'type=${error.runtimeType}',
        );
        debugPrintStack(stackTrace: stackTrace);
      }
    }
  }
}
