import 'package:flutter/material.dart';

class MyErrorPage extends StatefulWidget {
  const MyErrorPage({super.key});

  @override
  State<MyErrorPage> createState() => _MyErrorPageState();
}

class _MyErrorPageState extends State<MyErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Image is not found"),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
