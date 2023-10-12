import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_page/pages/form.dart';

void main() {
  testWidgets('Form Testing', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegistrationPage()));

    final fullNameField = find.byKey(const Key('name'));
    final emailField = find.byKey(const Key('email'));
    final gradeField = find.byKey(const Key('grade'));

    await tester.enterText(fullNameField, 'John Doe');
    await tester.enterText(emailField, 'johndoe@example.com');
    await tester.enterText(gradeField, '12th Grade');

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('johndoe@example.com'), findsOneWidget);
    expect(find.text('12th Grade'), findsOneWidget);
    expect(find.text('Registration'), findsOneWidget);
  });
  testWidgets('App Bar Testing', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegistrationPage()));

    expect(find.text('Registration'), findsOneWidget);
  });
}
