import 'package:api/view/image_view.dart';
import 'package:api/view/update_view.dart';
import 'package:api/view/user_view.dart';
import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    const CreateUserPage(),
    const MyImagePage(),
    const MyUpdatePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: Color.fromARGB(255, 41, 111, 202),
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add),
                label: "User"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: 'Image',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.update),
                label: 'Update',
              ),
            ]
        )    
     );
  } 
}
