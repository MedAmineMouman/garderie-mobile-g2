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

    expect(find.text('Menus du jour'), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.notifications_outlined), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    expect(find.text('Petit déjeuner'), findsOneWidget);
    expect(find.text('Déjeuner'), findsOneWidget);
    expect(find.text('Goûter'), findsOneWidget);
    expect(find.text('🍊'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Une sélection de fruits de saison'),
      250,
    );
    expect(find.text('Fruits frais'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.text('Accueil'), findsOneWidget);
    expect(find.text('Menus'), findsOneWidget);
    expect(find.text('À propos'), findsOneWidget);
  });
}
