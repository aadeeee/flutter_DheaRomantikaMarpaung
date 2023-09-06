import 'package:flutter/material.dart';
import 'package:scafoldapp/pages/MaterialApp%202/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 161, 231, 120)),
      ),
      home: const MyMainPage(),
    );
  }
}
