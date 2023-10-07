// ignore_for_file: avoid_print

import 'package:api/view/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
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
                controller: prov.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => prov.validateName(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: prov.jobController,
                decoration: const InputDecoration(
                  labelText: 'Job',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => prov.validateJob(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (prov.key.currentState!.validate()) {
                    await prov.createNewUser(
                      name: prov.nameController.text,
                      job: prov.jobController.text,
                    );
                    prov.nameController.clear();
                    prov.jobController.clear();
                  }
                },
                child: const Text('Create User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
