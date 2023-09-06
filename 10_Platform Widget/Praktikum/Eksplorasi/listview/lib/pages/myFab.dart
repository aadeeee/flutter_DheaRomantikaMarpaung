import 'package:flutter/material.dart';

class MyFab extends StatefulWidget {
  const MyFab({super.key});

  @override
  State<MyFab> createState() => _MyFabState();
}

class _MyFabState extends State<MyFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF03DAC5),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              insetPadding: EdgeInsets.zero,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('FAB'),
                  backgroundColor: const Color(0xFF6200EE),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
