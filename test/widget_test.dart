// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ma_garderie/main.dart';

void main() {
  testWidgets('Splash screen shows the welcome content and image', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaGarderieApp());
    await tester.pump();

    expect(find.text('Ma Garderie'), findsOneWidget);
    expect(find.text('Bienvenue dans notre garderie'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('Splash screen opens the home page after three seconds', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaGarderieApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('Page principale'), findsOneWidget);
  });
}
