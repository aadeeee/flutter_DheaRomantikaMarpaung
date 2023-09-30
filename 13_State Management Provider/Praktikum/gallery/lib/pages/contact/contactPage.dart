import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gallery/provider/my_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({Key? key}) : super(key: key);

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
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
    final prov = Provider.of<MyProvider>(context, listen: false);
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
                  initialDate: prov.currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(prov.dueDate.year + 5),
                );
                prov.updateSelectedDate(selectDate ?? prov.selectedDate);
              },
              child: const Text("Select"),
            )
          ],
        ),
        Text(DateFormat("dd-MM-yyyy").format(prov.selectedDate)),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    final prov = Provider.of<MyProvider>(context, listen: false);
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
          color: prov.currentColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(prov.currentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Pick Your Color"),
                    content: BlockPicker(
                      pickerColor: prov.currentColor,
                      onColorChanged: (color) {
                        prov.updateColor(color);
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          prov.onClosePage(context);
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
    final prov = Provider.of<MyProvider>(context, listen: false);
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
              prov.pickFile();
            },
            child: const Text("Pick and Open File"),
          ),
        ),
        Visibility(
          visible: prov.isfilePath.isNotEmpty,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Image.file(
              File(prov.isfilePath),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  Widget buildForm(BuildContext context) {
    final prov = Provider.of<MyProvider>(context, listen: false);
    return Form(
      key: prov.key,
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
                  controller: prov.getNameController,
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
                  validator: (value) => prov.validateName(value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  key: const Key('number'),
                  controller: prov.getNumberController,
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
                  validator: (value) => prov.validatePhoneNumber(value),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListForm(BuildContext context) {
    final prov = Provider.of<MyProvider>(context, listen: false);
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
              itemCount: prov.account.length,
              itemBuilder: (context, index) {
                final contact = prov.account[index];
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

                          prov.geteditNameController.text = previousName;
                          prov.geteditNumberController.text = previousNumber;

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
                                      controller: prov.geteditNameController,
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
                                      validator: (value) =>
                                          prov.validateName(value),
                                    ),
                                    TextFormField(
                                      key: const Key('edit_number'),
                                      controller: prov.geteditNumberController,
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
                                      validator: (value) =>
                                          prov.validatePhoneNumber(value),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      prov.onSubmitEdit(
                                          context,
                                          index,
                                          previousName,
                                          previousNumber,
                                          prov.currentDate,
                                          prov.currentColor,
                                          prov.selectedFileName);
                                      prov.onClosePage(context);
                                    },
                                    child: const Text("Save"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      prov.onClosePage(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                ],
                              );
                            },
                          ).then((value) {
                            prov.geteditNameController.clear();
                            prov.geteditNumberController.clear();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                        ),
                        onPressed: () {
                          prov.deleteContact(index);
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
    final prov = Provider.of<MyProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              prov.processForm(context);
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
