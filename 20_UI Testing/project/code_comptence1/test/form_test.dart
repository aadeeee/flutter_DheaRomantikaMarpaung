import 'package:code_comptence1/pages/form.dart';
import 'package:code_comptence1/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';

void main() {
  testWidgets('Form Testing', (WidgetTester tester) async {
    final myProvider = MyProvider();
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: myProvider),
              ],
              child: MyForm(),
            );
          },
        ),
      ),
    );

    await tester.enterText(find.byKey(const Key('username')), 'John');
    await tester.enterText(find.byKey(const Key('email')), 'johndoe@gmail.com');
    await tester.tap(find.text('SUBMIT'));
    
    expect(find.text('Please enter a valid name'), findsNothing);
    expect(find.text('Please enter a valid email'), findsNothing);

    expect(find.byType(TextFormField), findsWidgets);
  });
}
