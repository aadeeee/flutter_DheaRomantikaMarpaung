import 'package:contact/pages/contact/contactPage.dart';
import 'package:contact/pages/setting/setting.dart';
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
              'Home',
            ),
          ),
          ListTile(
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