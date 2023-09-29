import 'package:flutter/material.dart';

class MyDetailImage extends StatefulWidget {
  final String image;
  const MyDetailImage({super.key, required this.image});

  @override
  State<MyDetailImage> createState() => _MyDetailImageState();
}

class _MyDetailImageState extends State<MyDetailImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Gambar"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                widget.image,
                height: 400,
                width: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
