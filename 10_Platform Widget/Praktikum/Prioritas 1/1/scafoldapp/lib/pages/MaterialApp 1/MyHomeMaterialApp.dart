import 'package:flutter/material.dart';
import 'package:scafoldapp/pages/drawer.dart';

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({super.key});

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MaterialApp',
        ),
      ),
      body: const Center(child: Text("This is material App"),),
      drawer: const MyDrawer(),
    );
  }
}