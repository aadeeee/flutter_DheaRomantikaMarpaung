import 'package:flutter/material.dart';
import 'package:gallery/pages/contact/contactPage.dart';
import 'package:gallery/pages/image/imagePage.dart';
import 'package:gallery/pages/setting/setting.dart';

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyContactPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text(
              'Gallery',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyImagePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Setting',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MySetting(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
