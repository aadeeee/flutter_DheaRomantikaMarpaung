import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/bloc/contact_list_bloc.dart';
import 'package:gallery/bloc/contact_list_event.dart';
import 'package:gallery/bloc/contact_list_state.dart';
import 'package:gallery/model/contact_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
        ),
        body: BlocBuilder<ContactListBloc, ContactListState>(
            builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  buildForm(context),
                  buildButtonSubmit(context),
                  buildListForm(context)
                ],
              ),
            ),
          );
        }));
  }

  Widget buildForm(BuildContext context) {
    return Form(
        key: _key,
        child: BlocBuilder<ContactListBloc, ContactListState>(
            builder: (context, state) {
          return Column(
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
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 70, 68, 68)),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 237, 250),
                        labelText: "Name",
                        labelStyle:
                            TextStyle(fontSize: 18, color: Colors.black),
                        hintText: "Insert Your Name",
                        hintStyle: TextStyle(fontSize: 12),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        return context
                            .read<ContactListBloc>()
                            .validateInputName(value!);
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
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 70, 68, 68)),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 237, 250),
                        labelText: "Nomor",
                        labelStyle:
                            TextStyle(fontSize: 18, color: Colors.black),
                        hintText: "+62...",
                        hintStyle: TextStyle(fontSize: 12),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      validator: (value) {
                        return context
                            .read<ContactListBloc>()
                            .validateInputPhone(value!);
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        }));
  }

  Widget buildListForm(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<ContactListBloc, ContactListState>(
            builder: (context, state) {
          final List<Contact> contactList = state.contact;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "List Contacts",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: contactList.length,
                  itemBuilder: (context, index) {
                    final contact = contactList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            const Color.fromARGB(255, 188, 174, 233),
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
                                            fillColor: Color.fromARGB(
                                                255, 240, 237, 250),
                                            labelText: "Name",
                                            labelStyle: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                            hintStyle: TextStyle(fontSize: 12),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                          ),
                                          validator: (value) {
                                            return context
                                                .read<ContactListBloc>()
                                                .validateInputName(value!);
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
                                            fillColor: Color.fromARGB(
                                                255, 240, 237, 250),
                                            labelText: "Nomor",
                                            labelStyle: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                            hintText: "+62...",
                                            hintStyle: TextStyle(fontSize: 12),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                          ),
                                          validator: (value) {
                                            return context
                                                .read<ContactListBloc>()
                                                .validateInputPhone(value!);
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
                                            context
                                                .read<ContactListBloc>()
                                                .add(EditContactEvent(
                                                  index: index,
                                                  newName: updatedName,
                                                  newNumber: updatedNumber,
                                                ));
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
                              context
                                  .read<ContactListBloc>()
                                  .add(RemoveContactEvent(index: index));
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
        }));
  }

  Widget buildButtonSubmit(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              if (_key.currentState!.validate()) {
                String name = _nameController.text;
                String number = _numberController.text;
                context.read<ContactListBloc>().add(AddContactEvent(
                      contact: Contact(
                        name,
                        number,
                      ),
                    ));
                context.read<ContactListBloc>().add(PrintAccountListEvent());

                _nameController.clear();
                _numberController.clear();
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
