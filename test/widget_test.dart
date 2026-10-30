import 'package:flutter_test/flutter_test.dart';

import 'package:medreturn/app/app.dart';

void main() {
  testWidgets('MedReturnApp renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MedReturnApp());

    // Verify that the app name is displayed on the placeholder home screen.
    expect(find.text('MedReturn'), findsOneWidget);
  });
}
