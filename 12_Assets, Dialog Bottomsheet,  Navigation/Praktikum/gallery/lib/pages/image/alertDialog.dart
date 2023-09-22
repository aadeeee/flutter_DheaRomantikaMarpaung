import 'package:flutter/material.dart';

class MyAlertPage extends StatefulWidget {
  final String img;
  const MyAlertPage({super.key, required this.img});

  @override
  State<MyAlertPage> createState() => _MyAlertPageState();
}

class _MyAlertPageState extends State<MyAlertPage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            widget.img,
            height: 200,
            width: 300,
            fit: BoxFit.cover,
          ),
        ],
      ),
      actions: <Widget>[
        const Center(
          child: Text("Lihat Detail Gambar?"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Tidak")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/detailImage',
                        arguments: widget.img);
                  },
                  child: const Text("Ya")),
            )
          ],
        ),
      ],
    );
  }
}
