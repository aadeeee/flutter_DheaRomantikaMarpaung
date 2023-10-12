import 'package:code_comptence1/pages/form.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFD9D9D9),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
        endDrawer: const Drawer(
          child: Center(
            child: Column(
              children: [
                Text('End Drawer'),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 10),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 200,
                  ),
                ),
                const Text(
                  "Welcome to Wardiere Inc.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "Wardiere Inc. is a company that operates in various business fields. With a focus on innovation, integrity, and customer service, Wardiere Inc. has become a leader in diverse industries.",
                    textAlign: TextAlign.center,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Contact us",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Need to get in touch with us? Either fill out the form with your inquiry or find the ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Department email",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: " you'd like to contact below.",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const MyForm()
              ],
            ),
          ),
        ));
  }
}
