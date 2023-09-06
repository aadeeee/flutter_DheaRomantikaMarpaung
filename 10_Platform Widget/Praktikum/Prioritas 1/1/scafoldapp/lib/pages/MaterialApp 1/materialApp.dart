import 'package:flutter/material.dart';
import 'package:scafoldapp/pages/MaterialApp%201/MyHomeMaterialApp.dart';
import 'package:scafoldapp/pages/setting.dart';

class MyMainMaterialPage extends StatefulWidget {
  const MyMainMaterialPage({super.key});

  @override
  State<MyMainMaterialPage> createState() => _MyMainMaterialPageState();
}

class _MyMainMaterialPageState extends State<MyMainMaterialPage> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    const MyMaterialApp(),
    const MySetting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: Colors.green,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            )
          ]),
    );
  }
}
