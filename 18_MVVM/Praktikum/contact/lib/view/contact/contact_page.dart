import 'package:contact/helper/db_manager.dart';
import 'package:contact/models/contactmodel.dart';
import 'package:contact/view/view_model/contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyContactPage extends StatefulWidget {
  const MyContactPage({Key? key}) : super(key: key);

  @override
  State<MyContactPage> createState() => _MyContactPageState();
}

class _MyContactPageState extends State<MyContactPage> {
  late SharedPreferences loginData;
  String username = ' ';

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username').toString();
    });
  }

  List<Contact> _contact = [];

  Future<void> _loadContacts() async {
    try {
      List<Contact> contacts = await DbManager().getAllContacts();
      setState(() {
        _contact = contacts;
      });
    } catch (e) {
      print("Error loading contacts: $e");
    }
  }

  Future<void> _addContact(String name, String number) async {
    try {
      await DbManager().addContact(name, number);
      Contact newContact = Contact(nama: name, nomor: int.parse(number));
      setState(() {
        _contact.add(newContact);
      });
    } catch (e) {
      print("Error adding contact: $e");
    }
  }

  @override
  void initState() {
    _loadContacts();
    initial();
    super.initState();
  }

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
            crossAxisAlignment:
                CrossAxisAlignment.start, 
            children: [
              Text('Welcome $username',
                  textAlign: TextAlign.left, style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
              buildForm(context),
              buildButtonSubmit(context),
              buildListForm(context)
            ],
          ),
        ),
      ),
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
                  controller: prov.nameController,
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
                    } else if (!prov.capital(value)) {
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
                  controller: prov.numberController,
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
    final prov = Provider.of<MyProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "List Contacts",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 10,
          child: ListView.builder(
            itemCount: _contact.length,
            itemBuilder: (context, index) {
              final contact = _contact[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color.fromARGB(255, 188, 174, 233),
                  child: Text(
                    contact.nama[0],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                title: Text(contact.nama),
                subtitle: Text("+68${contact.nomor.toString()}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: () async {
                        final previousName = contact.nama;
                        final previousNumber = contact.nomor.toString();

                        prov.editNameController.text = previousName;
                        prov.editNumberController.text = previousNumber;

                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Form(
                              key: prov.keyedit,
                              child: AlertDialog(
                                title: const Text("Edit Contact"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      key: const Key('edit_username'),
                                      controller: prov.editNameController,
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
                                        } else if (!prov.capital(value)) {
                                          return 'Words start with capital letters, no special characters.';
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      key: const Key('edit_number'),
                                      controller: prov.editNumberController,
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
                                    onPressed: () async {
                                      final updatedName =
                                          prov.editNameController.text;
                                      final updatedNumber =
                                          prov.editNumberController.text;

                                      if ((updatedName.isNotEmpty ||
                                              updatedNumber.isNotEmpty) &&
                                          (updatedName != previousName ||
                                              updatedNumber !=
                                                  previousNumber)) {
                                        String updatedNumberAsString =
                                            updatedNumber.toString();
                                        await DbManager().updateContact(
                                            contact.id ?? 0,
                                            updatedName,
                                            updatedNumberAsString);
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
                              ),
                            );
                          },
                        ).then((value) {
                          prov.editNameController.clear();
                          prov.editNumberController.clear();
                          _loadContacts();
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                      ),
                      onPressed: () async {
                        await DbManager().deleteContact(contact.id ?? 0);
                        _loadContacts();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildButtonSubmit(BuildContext context) {
    final prov = Provider.of<MyProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () async {
              if (prov.key.currentState!.validate()) {
                String name = prov.nameController.text;
                String number = prov.numberController.text;

                await _addContact(name, number);

                prov.nameController.clear();
                prov.numberController.clear();
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
