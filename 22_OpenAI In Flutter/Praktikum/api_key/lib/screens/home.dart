import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../View/view_models/recomendation_view_model.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Phone Recomendations"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: SingleChildScrollView(child: Consumer<RecomendationProvider>(
          builder: (context, prov, child) {
            return Form(
              key: prov.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 10),
                    child: TextFormField(
                      controller: prov.budgetController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 197, 193, 193)),
                        ),
                        enabledBorder: UnderlineInputBorder(),
                        filled: true,
                        labelText: "Budget",
                        labelStyle:
                            TextStyle(fontSize: 18, color: Colors.black),
                        hintText: "Enter your budget in IDR",
                        hintStyle: TextStyle(fontSize: 12),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) => prov.validateNumber(value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextFormField(
                      controller: prov.cameraController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 70, 68, 68)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        filled: true,
                        labelText: "Camera (MP)",
                        labelStyle:
                            TextStyle(fontSize: 18, color: Colors.black),
                        hintText: "Enter your requirement for the Camera",
                        hintStyle: TextStyle(fontSize: 12),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextFormField(
                      controller: prov.storageController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 70, 68, 68)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        filled: true,
                        labelText: "Internal Storage",
                        labelStyle:
                            TextStyle(fontSize: 18, color: Colors.black),
                        hintText: "Enter Your Desired Internal Storage",
                        hintStyle: TextStyle(fontSize: 12),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: prov.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              prov.setContext(context);
                              await prov.getRecomendations();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              backgroundColor: Colors.blue,
                              minimumSize: const Size(double.infinity, 40),
                            ),
                            child: const Text(
                              "Get Recomendations",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                  ),
                ],
              ),
            );
          },
        )));
  }
}
