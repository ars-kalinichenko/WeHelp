// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:we_help/components/text_button.dart';
import 'package:we_help/main.dart';

void main() {
  testWidgets('Registration smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(WeHelp());

    expect(find.text('WeHelp'), findsOneWidget);
    expect(find.text("Решение есть"), findsOneWidget);
    expect(find.widgetWithText(TextButton, "Политика конфиденциальности"), findsOneWidget);
    expect(find.widgetWithText(TextButton, "Зарегистрироваться"), findsOneWidget);

    // Tap the 'registration' button and trigger a frame.
//    await tester.tap(find.widgetWithText(TextButton, "Зарегистрироваться"));
//    await tester.pump();
//    expect(find.widgetWithText(RoundedGradientButton, "Продолжить"), findsOneWidget);
  });

}
