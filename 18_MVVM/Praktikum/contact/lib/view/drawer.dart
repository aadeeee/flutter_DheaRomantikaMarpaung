
import 'package:contact/view/account/login.dart';
import 'package:contact/view/contact/contact_page.dart';
import 'package:contact/view/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late SharedPreferences loginData;
  String username = ' ';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username').toString();
    });
  }

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
          TextButton(
              onPressed: () {
                loginData.setBool('login', true);
                loginData.remove('username');
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const MyLoginPage()));
              },
              child: const Text("LOG OUT")),
        ],
      ),
    );
  }
}
