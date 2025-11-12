// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Пумпај ја целата апка
    await tester.pumpWidget(const ExamsApp());

    // Го гледаме насловот од AppBar
    expect(find.textContaining('Распоред за испити'), findsOneWidget);

    // Има барем една картичка (Card) во листата
    expect(find.byType(Card), findsWidgets);

    // Долу има Chip со вкупниот број на испити
    expect(find.byType(Chip), findsWidgets);

    // Клик на првата картичка -> се отвора деталниот екран
    final firstCard = find.byType(Card).first;
    await tester.tap(firstCard);
    await tester.pumpAndSettle();

    // Во деталите треба да стои "Детален преглед" во AppBar
    expect(find.text('Детален преглед'), findsOneWidget);
  });
}
