import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/models/auth_user.dart';
import 'package:medreturn/services/auth_service_provider.dart';

void main() {
  setUp(AuthServiceProvider.reset);
  tearDown(AuthServiceProvider.reset);

  test('reports missing Firebase initialization before creating auth service', () {
    expect(
      () => AuthServiceProvider.instance,
      throwsA(
        isA<AuthException>()
            .having((error) => error.code, 'code', 'firebase-not-initialized')
            .having(
              (error) => error.message,
              'message',
              contains('Firebase is not configured'),
            ),
      ),
    );
  });
}
