import 'package:cupertinoapp/Cupertino/Home.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatelessWidget {
  final _themeDart = const CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null, null);

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _themeDart,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
