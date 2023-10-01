import 'package:contact/helper/db_manager.dart';
import 'package:contact/pages/account/login.dart';
import 'package:contact/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DbManager()),
        ChangeNotifierProvider(create: (context) => MyProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(255, 198, 214, 214)),
        ),
        home: const MyLoginPage(),
      ),
    );
  }
}
