// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:we_help/components/text_button.dart';

import 'package:we_help/main.dart';

void main() {
  testWidgets('Registration smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(WeHelp());

    expect(find.text('WeHelp'), findsOneWidget);
    expect(find.text("Решение есть"), findsOneWidget);

    // Tap the 'registration' button and trigger a frame.
    await tester.tap(find.byElementType(TextButton));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

}
