import 'package:flutter_test/flutter_test.dart';
import 'package:medreturn/app/app.dart';
import 'package:medreturn/core/constants/app_strings.dart';

void main() {
  testWidgets('MedReturnApp renders LoginScreen as initial route', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MedReturnApp());

    // Verify that the login screen elements appear
    expect(find.text(AppStrings.appName), findsOneWidget);
    expect(find.text(AppStrings.loginButton), findsOneWidget);
  });
}
