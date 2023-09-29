import 'package:flutter/material.dart';
import 'package:gallery/pages/learn/my_fab.dart';
import 'package:gallery/pages/learn/my_learn.dart';

class MyLearnPage extends StatefulWidget {
  const MyLearnPage({super.key});

  @override
  State<MyLearnPage> createState() => _MyLearnPageState();
}

class _MyLearnPageState extends State<MyLearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: const MyLearn(),
      floatingActionButton: const MyFab(),
    );
  }
}
