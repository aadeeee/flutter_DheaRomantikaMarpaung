import 'package:flutter/material.dart';
import 'package:gallery/mainpage.dart';
import 'package:gallery/pages/contact/contactPage.dart';
import 'package:gallery/pages/image/detail_image.dart';
import 'package:gallery/pages/image/image_error.dart';
import 'package:gallery/pages/image/image_page.dart';
import 'package:gallery/pages/learn/eksplorasi.dart';
import 'package:gallery/pages/setting/setting.dart';
import 'package:gallery/provider/my_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MyProvider()),
    ], child: const MyApp()),
  );
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
              centerTitle: true),
          drawerTheme: const DrawerThemeData(
              backgroundColor: Color.fromARGB(255, 47, 151, 151))),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyMainPage(),
        '/detailImage': (context) {
          final img = ModalRoute.of(context)!.settings.arguments as String?;
          if (img != null) {
            return MyDetailImage(image: img);
          } else {
            return const MyErrorPage();
          }
        },
        '/contact': (context) => const MyContactPage(),
        '/image': (context) => const MyImagePage(),
        '/setting': (context) => const MySetting(),
        '/myLearn': (context) => const MyLearnPage(),
      },
    );
  }
}
