import 'package:flutter/material.dart';
import 'package:minggu_6/mainpage.dart';

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
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 198, 214, 214)),
      ),
      home: const MyMainPage(),
    );
  }
}
