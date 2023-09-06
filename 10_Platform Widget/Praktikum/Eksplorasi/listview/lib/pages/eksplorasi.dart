import 'package:flutter/material.dart';
import 'package:listview/pages/myFab.dart';
import 'package:listview/pages/myLearn.dart';

class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({super.key});

  @override
  State<MyFlutterApp> createState() => _MyFlutterAppState();
}

class _MyFlutterAppState extends State<MyFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search,color: Colors.white,))],
        backgroundColor: const Color(0xFF6200EE),
      ),
      body: const MyLearn(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF6200EE),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/info.png')),
              label: 'Information',
            )
          ]),
      floatingActionButton: const MyFab(),
    );
  }
}




