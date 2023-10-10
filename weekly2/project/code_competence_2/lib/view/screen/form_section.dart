import 'package:code_competence_2/view/view_model.dart/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, prov, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Form(
            key: prov.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          key: const Key('username'),
                          controller: prov.firstNameController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 70, 68, 68)),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 70, 68, 68),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFD9D9D9),
                            labelText: "First Name*",
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                            hintText: "Insert Your First Name",
                            hintStyle: TextStyle(fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: (value) => prov.validateName(value),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          key: const Key('lastname'),
                          controller: prov.lastNameController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 70, 68, 68),
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 70, 68, 68),
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFD9D9D9),
                            labelText: "Last Name*",
                            labelStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                            hintText: "Insert Your Last Name",
                            hintStyle: TextStyle(fontSize: 12),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: (value) => prov.validateName(value),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const Key('email'),
                    controller: prov.emailController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 70, 68, 68),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 70, 68, 68),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      labelText: "Email*",
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      hintText: "johndoe@gmail.com",
                      hintStyle: TextStyle(fontSize: 12),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) => prov.validateEmail(value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const Key('message'),
                    controller: prov.messageController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 70, 68, 68)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 70, 68, 68),
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      labelText: "What can we help you with?",
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      hintText: "Insert Your Message",
                      hintStyle: TextStyle(fontSize: 12),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text("SUBMIT",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        prov.showDialogContact(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
