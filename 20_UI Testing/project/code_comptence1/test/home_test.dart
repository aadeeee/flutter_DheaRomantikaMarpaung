import 'package:code_comptence1/pages/form.dart';
import 'package:code_comptence1/pages/home.dart';
import 'package:code_comptence1/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';

void main() {
  testWidgets('Home Page Testing', (WidgetTester tester) async {
    final myProvider = MyProvider();
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: myProvider),
          ],
          child: const MyHomePage(),
        ),
      ),
    );

    expect(find.text('Welcome to Wardiere Inc.'), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
    expect(find.byType(MyForm), findsOneWidget);
  });
}
