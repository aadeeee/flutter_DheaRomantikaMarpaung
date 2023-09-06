import 'package:flutter/material.dart';
import 'package:scafoldapp/pages/drawer.dart';

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
          'MaterialApp',
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
    final List<Map<String, dynamic>> _listcontact = [
      {
        'name': 'Leane Graham',
        'number': "1-770-68031 x56442",
      },
      {
        'name': 'Ervin Howell',
        'number': "010-692-6593 x09125",
      },
      {
        'name': 'Clementine Bauch',
        'number': "1-463-123-4447",
      },
      {
        'name': 'Patricia Lebsack',
        'number': "493-170-9623 x156",
      },
      {
        'name': 'Chelsey Dietrich',
        'number': "(254)954-1289",
      },
      {
        'name': 'Mrs. Dennis Schullist',
        'number': "1-477-953-8478 x6430",
      },
      {
        'name': 'Kurtis Weissnat',
        'number': "210.067.6132",
      },
    ];
    return ListView.builder(
        itemCount: _listcontact.length,
        itemBuilder: (context, index) {
          final listItem = _listcontact[index];
          final avatar = listItem["name"][0];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(avatar, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
            title: Text(listItem['name']),
            subtitle: Text(listItem["number"]),
          );
        });
  }
}
