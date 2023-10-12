import 'package:contact/pages/contact/contactPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('Pengecekan App Bar', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyContactPage(),
    ));

    expect(find.text("Contacts"), findsOneWidget);
  });

  testWidgets('Pengecekan Date Picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyContactPage(),
    ));

    await tester.tap(find.text('Select'));
    expect(find.text(DateFormat("dd-MM-yyyy").format(DateTime.now())),
        findsOneWidget);
  });
  testWidgets('Pengecekan Color Picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyContactPage(),
    ));

    await tester.tap(find.text('Pick Color'));
    await tester.pumpAndSettle();

    expect(find.byType(BlockPicker), findsOneWidget);
  });
  testWidgets('Pengecekan Submit Button', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyContactPage(),
    ));

    await tester.enterText(find.byKey(const Key('username')), 'Dhea');
    await tester.enterText(find.byKey(const Key('number')), '123456789');

    await tester.tap(find.text('Submit'));

    expect(find.text('Dhea'), findsOneWidget);
    expect(find.text('123456789'), findsOneWidget);
  });
  testWidgets('Pengecekan File Picker', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyContactPage(),
    ));
    expect(find.text("Pick Files"), findsOneWidget);

    await tester.tap(find.text("Pick and Open File"));
  });

  testWidgets('Pengecekan List Form', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MyContactPage(),
    ));

    expect(find.text("List Contacts"), findsOneWidget);

    expect(find.byType(ListView), findsOneWidget);
  });
}
