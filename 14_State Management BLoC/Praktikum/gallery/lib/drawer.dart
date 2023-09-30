import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const ListTile(
            title: Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 30,)
            ),
            
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text(
              'Contact',
            ),
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text(
              'Gallery',
            ),
            onTap: () {
                  Navigator.pushNamed(context, '/image');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text(
              'MyLearn',
            ),
            onTap: () {
                  Navigator.pushNamed(context, '/myLearn');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Setting',
            ),
            onTap: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
        ],
      ),
    );
  }
}
