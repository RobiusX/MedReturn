import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/firebase_options.dart';
import 'package:medreturn/services/firebase_initializer.dart';

void main() {
  group('Firebase Configuration and Initialization Verification', () {
    test('DefaultFirebaseOptions for Android matches Firebase Console configuration', () {
      const androidOptions = DefaultFirebaseOptions.android;

      expect(androidOptions.projectId, 'medreturn-v1');
      expect(androidOptions.apiKey, 'AIzaSyCIRGLMO2L9KptSKRWXx2nli19K50sAmqY');
      expect(androidOptions.appId, '1:324145053328:android:fd2834f128894c13d22215');
      expect(androidOptions.messagingSenderId, '324145053328');
      expect(androidOptions.storageBucket, 'medreturn-v1.firebasestorage.app');
    });

    test('FirebaseInitializer safely handles initialization call without unhandled crash', () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      // Ensure that calling initialize with DefaultFirebaseOptions completes safely
      await expectLater(
        FirebaseInitializer.initialize(options: DefaultFirebaseOptions.android),
        completes,
      );
    });
  });
}

