import 'package:code_competence_2/view/screen/about_us_section.dart';
import 'package:code_competence_2/view/screen/drawer_page.dart';
import 'package:code_competence_2/view/screen/form_section.dart';
import 'package:code_competence_2/view/screen/logo_section.dart';
import 'package:code_competence_2/view/view_model.dart/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: prov.isAppBarVisible
          ? AppBar(
              backgroundColor: const Color(0xFFD9D9D9),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            )
          : null,
      endDrawer: const MyDrawerPage(),
      body: Consumer<MyProvider>(
        builder: (context, myProvider, child) {
          return NotificationListener<ScrollUpdateNotification>(
            onNotification: (scrollNotification) {
              myProvider
                  .updateAppBarVisibility(scrollNotification.metrics.pixels);
              return true;
            },
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [MyLogoSection(), MyForm(), AboutUsPage()],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Contact',
        ),
      ]),
    );
  }
}
