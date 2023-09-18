// ignore: file_names
// ignore_for_file: avoid_print, file_names, duplicate_ignore

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:minggu_6/model/contactmodel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({Key? key}) : super(key: key);

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _editNameController = TextEditingController();
  final TextEditingController _editNumberController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final List<Contact> _account = [];

  void addContact(
      String name, String number, DateTime date, Color color, String fileName) {
    setState(() {
      _account.add(Contact(name, number, date, color, fileName));
    });
  }

  void printAccount() {
    List<String> accountList =
        _account.map((contact) => contact.toString()).toList();
    print(accountList);
  }

  void editContact(int index, String newName, String newNumber,
      DateTime newDate, Color newColor, String newFileName) {
    setState(() {
      _account[index] =
          Contact(newName, newNumber, newDate, newColor, newFileName);
    });
  }

  void deleteContact(int index) {
    if (index >= 0 && index < _account.length) {
      setState(() {
        _account.removeAt(index);
      });
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool capital(String text) {
    final words = text.split(' ');
    for (final word in words) {
      if (!RegExp(r'^[A-Z][a-zA-Z\s]*$').hasMatch(word)) {
        return false;
      }
    }
    return true;
  }

  DateTime dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color currentColor = Colors.orange;

  late String selectedFileName;
  bool isFileSelected = false;
  String isfilePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              buildForm(context),
              buildDatePicker(context),
              buildColorPicker(context),
              buildFilePicker(context),
              buildButtonSubmit(context),
              buildListForm(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date"),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectDate != null) {
                    dueDate = selectDate;
                  }
                });
              },
              child: const Text("Select"),
            )
          ],
        ),
        Text(DateFormat("dd-MM-yyyy").format(dueDate)),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Color"),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: currentColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(currentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Pick Your Color"),
                    content: BlockPicker(
                      pickerColor: currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Pick Color"),
          ),
        ),
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pick Files"),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              pickFile();
            },
            child: const Text("Pick and Open File"),
          ),
        ),
        if (isfilePath.isNotEmpty)
          SizedBox(
            width: 40,
            height: 40,
            child: Image.file(
              File(isfilePath),
              fit: BoxFit.cover,
            ),
          )
      ],
    );
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    final selectedFileName = file.name;
    final filepath = file.path;
    setState(() {
      this.selectedFileName = selectedFileName;
      isfilePath = filepath ?? "";
      isFileSelected = true;
    });

    openFile(file);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Center(child: Icon(Icons.phone_android_sharp)),
          ),
          const Text("Create New Contacts",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              "A dialog is a type of modal window that appears in front of app content to provide critical information or prompt for a decision to be made.",
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Divider(
              thickness: 1,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  key: const Key('username'),
                  controller: _nameController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 68, 68)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 240, 237, 250),
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                    hintText: "Insert Your Name",
                    hintStyle: TextStyle(fontSize: 12),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    } else if (value.split(' ').length < 2) {
                      return 'Name must have at least 2 words';
                    } else if (!capital(value)) {
                      return 'Words start with capital letters, no special characters.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  key: const Key('number'),
                  controller: _numberController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 70, 68, 68)),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 240, 237, 250),
                    labelText: "Nomor",
                    labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                    hintText: "+62...",
                    hintStyle: TextStyle(fontSize: 12),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone Number is required';
                    } else if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(value)) {
                      return 'Phone numbers must start with 0 and have 8-15 digits';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListForm(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "List Contacts",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              itemCount: _account.length,
              itemBuilder: (context, index) {
                final contact = _account[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 188, 174, 233),
                    child: Text(
                      contact.title[0],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  title: Text(contact.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contact.subtitle),
                      Text(
                          "Date: ${DateFormat("dd-MM-yyyy").format(contact.date)}"),
                      Row(
                        children: [
                          const Text("Color:"),
                          const SizedBox(width: 5),
                          Container(
                            width: 10,
                            height: 10,
                            color: contact.color,
                          ),
                        ],
                      ),
                      Text("File Name: ${contact.fileName}"),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                        ),
                        onPressed: () {
                          final previousName = contact.title;
                          final previousNumber = contact.subtitle;

                          _editNameController.text = previousName;
                          _editNumberController.text = previousNumber;

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Edit Contact"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      key: const Key('edit_username'),
                                      controller: _editNameController,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 70, 68, 68)),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 240, 237, 250),
                                        labelText: "Name",
                                        labelStyle: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        hintStyle: TextStyle(fontSize: 12),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Name is required';
                                        } else if (value.split(' ').length <
                                            2) {
                                          return 'Name must have at least 2 words';
                                        } else if (!capital(value)) {
                                          return 'Words start with capital letters, no special characters.';
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      key: const Key('edit_number'),
                                      controller: _editNumberController,
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 70, 68, 68)),
                                        ),
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(255, 240, 237, 250),
                                        labelText: "Nomor",
                                        labelStyle: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                        hintText: "+62...",
                                        hintStyle: TextStyle(fontSize: 12),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Phone Number is required';
                                        } else if (!RegExp(r'^0[0-9]{7,14}$')
                                            .hasMatch(value)) {
                                          return 'Phone numbers must start with 0 and have 8-15 digits';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      final updatedName =
                                          _editNameController.text;
                                      final updatedNumber =
                                          _editNumberController.text;

                                      if ((updatedName.isNotEmpty ||
                                              updatedNumber.isNotEmpty) &&
                                          (updatedName != previousName ||
                                              updatedNumber !=
                                                  previousNumber)) {
                                        editContact(
                                            index,
                                            updatedName,
                                            updatedNumber,
                                            currentDate,
                                            currentColor,
                                            selectedFileName);
                                      }

                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Save"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                ],
                              );
                            },
                          ).then((value) {
                            _editNameController.clear();
                            _editNumberController.clear();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                        ),
                        onPressed: () {
                          deleteContact(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonSubmit(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              if (!isFileSelected) {
                showSnackbar("Pick a file first");
              } else if (_key.currentState!.validate()) {
                String name = _nameController.text;
                String number = _numberController.text;

                addContact(
                    name, number, dueDate, currentColor, selectedFileName);

                dueDate = DateTime.now();
                _nameController.clear();
                _numberController.clear();
                currentColor = Colors.orange;
                selectedFileName = "";
                isFileSelected = false;
                printAccount();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              fixedSize: const Size.fromWidth(100),
            ),
            child: const Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
