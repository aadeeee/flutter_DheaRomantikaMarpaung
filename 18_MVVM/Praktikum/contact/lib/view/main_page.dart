import 'package:contact/view/contact/contact_page.dart';
import 'package:contact/view/home/home.dart';
import 'package:contact/view/setting/setting.dart';
import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    const MyHome(),
    const MyContactPage(),
    const MySetting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: const Color.fromARGB(255, 77, 238, 184),
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
                icon: Icon(Icons.phone_android_outlined),
                label: 'Contact',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              )
            ]));
  }
}
