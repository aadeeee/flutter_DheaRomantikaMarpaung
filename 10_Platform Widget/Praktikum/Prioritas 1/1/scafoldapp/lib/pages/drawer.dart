import 'package:flutter/material.dart';
import 'package:scafoldapp/pages/setting.dart';

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