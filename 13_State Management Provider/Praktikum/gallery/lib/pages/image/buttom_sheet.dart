import 'package:flutter/material.dart';

class MyButtomSheetPage extends StatefulWidget {
  final String img;
  const MyButtomSheetPage({super.key, required this.img});

  @override
  State<MyButtomSheetPage> createState() => _MyButtomSheetPageState();
}

class _MyButtomSheetPageState extends State<MyButtomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(
                widget.img,
                height: 350,
                width: 350,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
