import 'package:api/view/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyUpdatePage extends StatefulWidget {
  const MyUpdatePage({super.key});

  @override
  State<MyUpdatePage> createState() => _MyUpdatePageState();
}

class _MyUpdatePageState extends State<MyUpdatePage> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create User"),
      ),
      body: Form(
        key: prov.key,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: prov.titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => prov.validateTitle(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: prov.bodyController,
                decoration: const InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => prov.validateBody(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                  prov.updateData();
                  prov.titleController.clear();
                  prov.bodyController.clear();
                },
                child: const Text('Update Contact'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
