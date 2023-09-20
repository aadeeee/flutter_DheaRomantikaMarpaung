import 'package:flutter/material.dart';
import 'package:gallery/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 47, 151, 151),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: "Poppins"),
              centerTitle: true
        ),
        drawerTheme:const DrawerThemeData(backgroundColor: Color.fromARGB(255, 47, 151, 151))
      ),
      home: const MyMainPage(),
    );
  }
}
