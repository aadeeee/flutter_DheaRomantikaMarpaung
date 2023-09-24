import 'package:flutter/material.dart';
import 'package:gallery/drawer.dart';
import 'package:gallery/provider/MyProvider.dart';
import 'package:provider/provider.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Pictures',
        ),
      ),
      body: const MyName(),
      drawer: const MyDrawer(),
    );
  }
}

class MyName extends StatelessWidget {
  const MyName({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProvider>(context);
    return ListView.builder(
        itemCount: prov.listContact.length,
        itemBuilder: (context, index) {
          final listItem = prov.listContact[index];
          final avatar = listItem["name"][0];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                avatar,
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(listItem['name']),
            subtitle: Text(listItem["number"]),
          );
        });
  }
}
